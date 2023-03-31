# ICRC1

ICRC1 is a standard for fungible tokens on the Internet Computer (IC). The standard specifies the types of [_data_](/common-programming-concepts/types.html), the[ _interface_](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) and certain [_functionality_](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) for fungible tokens on the IC.

The standard is defined in a [Candid file](https://github.com/dfinity/ICRC-1/blob/main/standards/ICRC-1/ICRC-1.did) accompanied by an [additional description](https://github.com/dfinity/ICRC-1/blob/main/standards/ICRC-1/README.md) of the intended behavior of any ICRC1 token.

> **NOTE**  
> _ICRC is an abbreviation of 'Internet Computer Request for Comments' and is chosen for historical reasons related to token developments in blockchains such as Ethereum and the popular ERC standards (Ethereum Request for Comments)_

#### On this page

[**ICRC1 Types**](#icrc1-types)  
&nbsp;&nbsp;&nbsp;&nbsp;[General Types](#general-types)  
&nbsp;&nbsp;&nbsp;&nbsp;[Account Types](#account-types)  
&nbsp;&nbsp;&nbsp;&nbsp;[Transaction Types](#transaction-types)

[**ICRC1 Interface**](#icrc1-interface)  
&nbsp;&nbsp;&nbsp;&nbsp;[General token info](#general-token-info)  
&nbsp;&nbsp;&nbsp;&nbsp;[Ledger functionality](#ledger-functionality)  
&nbsp;&nbsp;&nbsp;&nbsp;[Metadata and Extensions](#metadata-and-extensions)

[**Transaction deduplication**](#transaction-deduplication)  
&nbsp;&nbsp;&nbsp;&nbsp;[IC time and Client time](#ic-time-and-client-time)  
&nbsp;&nbsp;&nbsp;&nbsp;[Deduplication algorithm](#deduplication-algorithm)

## How it works

In essence, an ICRC1 token is an actor that maintains data about _accounts_ and _balances_.

The token _balances_ are represented in Motoko as simple `Nat` values belonging to certain [accounts](#account-types). Transferring tokens just comes down to subtracting from one balance of some account and adding to another balance of another account.

Because an [actor](/internet-computer-programming-concepts/actors.html) runs on the IC blockchain (and is therefore is tamperproof), we can trust that a correctly programmed actor would never 'cheat' and that it would correctly keep track of all balances and transfers.

# ICRC1 types

The required [data types](/common-programming-concepts/types.html) for interacting with an ICRC1 token are defined in the official [ICRC-1.did](https://github.com/dfinity/ICRC-1/blob/main/standards/ICRC-1/ICRC-1.did) file. We will cover their Motoko counterparts here. We have grouped all ICRC1 types in three groups: [_general_](#general-types), [_account_](#account-types) and [_transaction_](#transaction-types) types.

## General types

The standard defines three simple types that are used to define [more complex types](#transaction-types).

```motoko
{{#include _mo/icrc1-types.mo:a}}
```

The `Timestamp` type is another name for a `Nat64` and represents the number of nanoseconds since the UNIX epoch in UTC timezone. It is used in the definition of [transaction types](#transaction-types).

The `Duration` type is also a `Nat64`. It does not appear anywhere else in the specification but it may be used to represent the number of nanoseconds between two `Timestamp`s.

The `Value` type is a [variant](/common-programming-concepts/types/variants.html) that could either represent a `Nat`, an `Int`, a `Text` or a `Blob` value. It is used in the [`icrc1_metadata`](#metadata-and-extensions) function.

## Account types

A _token balance_ always belongs to one `Account`.

```motoko
{{#include _mo/icrc1-types.mo:b}}
```

An `Account` is a [record](/book/common-programming-concepts/types/records.html) with two fields: `owner` (of type `Principal`) and `subaccount`. This second field is an [_optional_](/common-programming-concepts/options-and-results.html) `Subaccount` type, which itself is defined as a `Blob`. This blob has to be exactly _32 bytes_ in size.

This means that one account is _always_ linked to one specific `Principal`. The notion of a _subaccount_ allows for every principal on the IC to have [many](#one-principal-many-accounts) ICRC1 accounts.

### Default account

Each principal has a _default account_ associated with it. The default account is constructed by setting the `subaccount` field to either `null` or supplying a `?Blob` with only `0` bytes.

### Account examples

Here's how we declare some accounts:

```motoko
{{#include _mo/icrc1-accounts.mo:a}}
```

`account1` is the _default account_ for the principal `un4fu-tqaaa-aaaab-qadjq-cai`. It is constructed by first making a `Principal` from the textual representation and making `subaccount` equal to `null`.

For `account2` we make a custom `Blob` from a `[Nat8]` array with 32 bytes. For no particular reason, we set the first four bytes to `1`. We also used _name punning_ for the `subaccount` field.

> **NOTE**  
> _We use the same principal (`un4fu-tqaaa-aaaab-qadjq-cai`) for both accounts. A principal can have [many accounts](#one-principal-many-accounts)_.

### One principal, many accounts

In our [last example](#account-examples), we used a `?Blob` with 32 bytes for our `subaccount`. The first 4 bytes already allow for 256 \* 256 \* 256 \* 256 = **4_294_967_296** different subaccounts.

The maximum amount of subaccounts for each principal is much much larger and equals 256^32 = 2^256 = **1.16 \* 10^77**, a natural number with 78 digits! A number like that can be represented in Motoko by a single `Nat`.

### Textual representation of an `Account`

https://github.com/dfinity/ICRC-1/pull/98

## Transaction types

The standard specifies two data types for the execution of token transfers (transactions) from one [account](#account-examples) to another. These are the `TransferArgs` [record](/common-programming-concepts/types/records.html) and the `TransferError` [variant](/common-programming-concepts/types/variants.html), which are used as the argument and part of the return type of the [`icrc1_transfer`](#ledger-functionality) function.

```motoko
{{#include _mo/icrc1-types.mo:c}}
```

The `TransferArgs` record has six fields, four of which are [optional](/common-programming-concepts/options-and-results.html) types. Only the `to` and `amount` fields have to be specified for the most basic transaction.

1. `from_subaccount` is an [optional](/common-programming-concepts/options-and-results.html) `Subaccount` (`?Blob`) and specifies whether to use a specific 32 byte subaccount to send from. The sender `Account` (containing a `Principal`) is NOT specified because this will be inferred from the [transfer function](#ledger-functionality), which is a [caller identifying function](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions). This ensures that no one can spend tokens except the owner of the account.
1. `to` is an `Account` and specifies the recipients accounts.
1. `amount` is a `Nat` and specifies the amount of tokens to be svariantent measured by the smallest subunits possible of the token (defined by the [token decimals](#general-token-info)).
1. `fee` is a `?Nat` that specifies an [optional](/common-programming-concepts/options-and-results.html) fee to be payed by the sender for a transaction measured by the smallest subunits possible of the token (defined by the [token decimals](#general-token-info)).
1. `memo` is a `?Blob` and specifies [optional](/common-programming-concepts/options-and-results.html) 32 byte binary data to include with a transaction.
1. `created_at_time` is a `?Timestamp` which specifies an [optional](/common-programming-concepts/options-and-results.html) [transaction time](#ic-time-and-client-time) for a transaction which maybe used for [transaction deduplication](#transaction-deduplication).

The `TransferError` [variant](/common-programming-concepts/types/variants.html) is used as the possible error type in the return value of the [`icrc1_transfer`](#ledger-functionality) function. It specifies several failure scenarios for a transaction.

1. `#BadFee` is returned when something is wrong with the senders fee in `TransferArgs` and informs about the expected fee through its associated type `{ expected_fee : Nat }`.
1. `#BadBurn` is returned when a [_burn transaction_](#ledger-functionality) tries to burn a too small amount of tokens and informs about the minimal burn amount through `{ min_burn_amount : Nat }`.
1. `#InsufficientFunds` is returned when the sender `Account` balance is smaller than the `amount` to be sent plus fee (if required). It returns the senders balance through `{ balance : Nat }`.
1. `#TooOld` and `#CreatedInFuture` are returned if a transaction is not made within a specific [time window](#deduplication-algorithm). They are used for [transaction deduplication](#transaction-deduplication).
1. `#TemporarilyUnavailable` is returned when token transfers are temporarily halted, for example during maintenance.
1. `#GenericError` allows us to specify any other error that may happen by providing error info through `{ error_code : Nat; message : Text }`.

The records in the associated types of `TransferError` may contain even more information about the failure by [subtyping](/advanced-types/subtyping.html) the records. The same applies for the fields of `TransferArgs`. An implementer of a token may choose to add more fields for their application and still be compliant with the standard.

# ICRC1 Interface

For a token to comply with ICRC1 it must implement a set of specified [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) as part of the [actor type](#/internet-computer-programming-concepts/actors.html#actor-type). The token implementation may implement more functions in the actor and still remain compliant with the standard, see [actor subtyping](/advanced-types/subtyping.html#actor-interfaces).

We have grouped the functions into three groups and used an actor type alias `ICRC1_Interface` which is not part of the standard:

```motoko
{{#include _mo/icrc1-types.mo:d}}
```

## General token info

The standard specifies five [query functions](/internet-computer-programming-concepts/actors.html#public-shared-query) that take no arguments and return general info about the token.

1. `icrc1_name` returns the name of the token as a `Text`.
1. `icrc1_symbol` return the ticker symbol as a `Text`.
1. `icrc1_decimals` returns the maximum number of decimal places of a unit token as a `Nat8`. Most tokens have 8 decimal places and the smallest subunit would be **0.00_000_001**.
1. `icrc1_fee` returns the fee to be paid for transfers of the token as a `Nat` measured in smallest subunits of the token (defined by the token decimals). The fee may be 0 tokens.
1. `icrc1_total_supply` returns the _current total supply_ as a `Nat` measured in smallest subunits of the token (defined by the token decimals). The total supply may change over time.

## Ledger functionality

ICRC1 intentionally excludes some ledger implementation details and does not specify how an actor should keep track of token balances and transaction history. It does specify three important [shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) to interact with the ledger, regardless of how the implementer of the standard chooses to implement the ledger.

1. `icrc1_minting_account` is a [query function](/internet-computer-programming-concepts/actors.html#public-shared-query) that takes no arguments and returns `?Account`, an [optional](/common-programming-concepts/options-and-results.html) account. The token ledger _may_ have a special account called the _minting account_. If this account exists, it would serve two purposes:

   - Token amounts sent **TO** the minting account would be _burned_, thus removing them from the total supply. This makes a token _deflationary_. Burn transactions have no fee.
   - Token amounts sent **FROM** the minting account would be _minted_, thus freshly created and added to the total supply. This makes a token _inflationary_. Mint transactions have no fee.

1. `icrc1_balance_of` is a [query function](/internet-computer-programming-concepts/actors.html#public-shared-query) that takes an `Account` as an argument and returns the balance of that account as a `Nat` measured in smallest subunits of the token (defined by the token decimals).

1. `icrc1_transfer` is the main and most important function of the standard. It is the only [update function](/internet-computer-programming-concepts/actors.html#public-shared-update) that [identifies its caller](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions) and is meant to transfer token amounts from one account to another. It takes the `TransferArgs` record as an argument and returns a result `Result<Nat, TransferError>`.

This function should perform important checks before approving the transfer:

- Sender and receiver account are not the same
- Sender has a balance bigger than amount to be sent plus fee
- Sender fee is not too small
- The subaccounts and memo are exactly 32 bytes
- The transaction is not a [duplicate](#transaction-deduplication) of another transaction
- The amount is larger than the minimum burn amount (in case of a burn transaction)
- And any other logic that we may want to implement...

If anything fails, the function returns `#Err(txError)` where `txError` is a `TransferError` indicating what has gone wrong.

If all checks are met, then the transfer is recorded and the function returns `#Ok(txIndex)` where `txIndex` is a `Nat` that represents the transaction index for the recorded transaction.

## Metadata and Extensions

1. `icrc1_metadata` is a [query](/internet-computer-programming-concepts/actors.html#public-shared-query) function that takes no arguments and returns an array of tuples `(Text, Value)`. The array may be empty. The tuples represent _metadata_ about the token that may be used for client integrations with the token. The tuple represents a key-value store. The data does not have to be constant and may change in time. Notice that we use the `Value` [variant](/common-programming-concepts/types/variants.html) in the tuple.
   - The `Text` is _namespaced_ and consists of two parts separated by a colon: `namespace:key`. The first part `namespace` may not contain colons (`:`) and represents a 'domain' of metadata. The second part `key` is the actual key which is a name for the `Value`.
   - The `icrc1` namespace is reserved is reserved for keys from the ICRC1 standard itself, like `icrc1:name`, `icrc1:symbol`, `icrc1:decimals` and `icrc1:fee`. Other keys could be added as part of the `icrc1` metadata domain, for example `icrc1:logo`.
   - Another domain of metadata could be `stats` for providing statistics about the distribution of tokens. Some keys could be `stats:total_accounts`, `stats:average_balance` and `stats:total_tx`.
1. `icrc1_supported_standards` is a [query](/internet-computer-programming-concepts/actors.html#public-shared-query) function that returns an array of records `{ name : Text; url : Text }`. Each record contains info about _another_ standard that may be implemented by this ICRC1 token. The ICRC1 token standard is intentionally designed to be very simple with the expectation that it will be extended by other standards. This _modularity of standards_ allows for flexibility. (Not every token needs all capabilities of advanced token ledgers)

# Transaction deduplication

Usually, when a client makes a transfer, the token canister responds with a `Result<Nat, TransferError>`. This way, the client knows whether the transfer was successful or not.

If the client fails to receive the transfer response (for some reason, like a network outage) from the canister, it has no way of knowing whether the transaction was successful or not. The client could implement some logic to check the balance of the account, but that's not a perfect solution because it would still not know why a transfer may have been rejected.

To offer a solution for this scenario (a client misses the response after making a transfer and doesn't know whether the transaction was successful), ICRC1 specifies _transaction deduplication_ functionality. An _identical transaction_ submitted more than once within a certain _time window_ is will not be accepted a second time.

The time window could be a period of say 24 hours. This way, a frequent user (like an exchange or trader perhaps) could label their transactions with a `created_at_time` and a (possibly unique) `memo`. The client could, in the case of a missed response, send the same transaction again within the allowed time window and learn about the status of the transaction.

If the initial transaction was successful, a correct implementation of ICRC1 would not record the transfer again and notify the client about the existing transaction by returning an error `#Duplicate : { duplicate_of : Nat }` with an index of the existing transaction (a `Nat` value).

## IC time and Client time

An actor (the _host_) who receives a transaction can get the current _IC time_ through the [Time Base Module](/base-library/utils/time.html).

A client could be a canister and in that case it would also get its time from the IC. But a client could also be a browser. In both cases, the _host time_ and _client time_ are not perfectly synced.

The _client_ may specify a `created_at_time` which is different from the IC time as perceived by an actor who receives a transactions at some point in time.

The token canister may even receive a transaction that appears to have been made in the future! The reason for this is that _client_ and _IC_ are not in perfect time sync.

## Deduplication algorithm

If a transaction contains both a valid `memo` and a `created_at_time`, then a correct implementation of ICRC1 should make two checks before accepting the transaction:

- The transaction should fall within a specific _time window_
- The transaction is not a _duplicate_ of another transaction within that time window

This time window is measured relative to IC time. Lets declare the IC time and relevant `Duration`s.

```motoko
import Time "mo:base/Time";

let now = Time.now();

let window : Duration = 24 * 60 * 60 * 10**9;

let drift : Duration = 60 * 10**9;
```

The time window spans from `now - (window + drift)` to `now + drift`.

- If the `created_at_time` is smaller than `now - (window + drift)`, the response should an error `#TooOld`.
- If the `created_at_time` is larger than `now + drift`, the response should be an error `#CreatedInFuture: { ledger_time : Timestamp }` where `ledger_time` is equal to `now`.
- If the transaction falls within the time window, then there must not exist a duplicate transaction in the ledger within the same window. If its does exist, an error `#Duplicate : { duplicate_of : Nat }` should be returned. A duplicate transaction is one with all parameters equal to the current transaction that is awaiting approval, including the exact `memo` and `created_at_time`.
- Otherwise `created_at_time` falls within the time window and has no duplicates and thus should be accepted by returning `#Ok(TxIndex)` where `TxIndex` is the index at which the transaction is recorded.
