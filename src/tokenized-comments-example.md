# Tokenized Comments Example

This chapters demonstrates how one can reward user interaction with virtual tokens. Its a simple comment section where users (after logging in) can leave a comment and like other comments.

**The purpose is to demonstrate how to use common programming language features in Motoko.**

We use a virtual token with a capped supply, but we intentionally don't allow transfers. This way, the token can be used to reward users, but it can't be traded on exchanges.

> **WARNING**  
> _This is NOT a digital crypto currency. Tokens can not be sent. The tokenomics model is not economically sound. The model is for code writing demonstrations only._

> **NOTE**  
> _The token is not an [ICRC1](/internet-computer-standards/icrc1.html) compliant token_

Rules are simple:

- You can only comment and like interact after logging in with [Internet Identity](https://identity.internetcomputer.org/).
- You may only comment once per 10 minutes and like once per minute.
- You earn 10 tokens for a posted comment
- You earn 1 token for every like you receive.

We start with a total supply of 10 000 tokens. When all tokens are given out, no more tokens can be earned.

## Project setup

The source code is [available here](https://github.com/Web3NL/web3comments). The project consists of two canisters:

- a backend canister written in Motoko
- a frontend UI built with Vite-SvelteKit-Tailwind.

The frontend is uploaded to a separate _frontend assets canister_ that can serve the website to a browser. The frontend canister calls the backend canister's shared functions to interact with the backend.

> **NOTE**  
> _The frontend, the authentication with [Internet Identity](https://identity.internetcomputer.org/) and the interaction with the backend from within Javascript code are outside the scope of this book._

### Backend canister source code

The backend canister source code is setup with the following files:

- `main.mo` contains the main actor, [datastores](#datastores-and-upgrading), [shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) and [system upgrade functions](#datastores-and-upgrading)
- `Constants.mo` contains the constants used in the project
- `Types.mo` contains the types used in the project
- `Utils.mo` contains utility functions used in the project
- `Comments.mo` contains the the implementations of the main shared functions

### Datastores

We use a `state` object of type `State` to hold the datastores:

```motoko
public type State = object {
    users : Users;
    commentStore : CommentStore;
    var commentHistory : CommentHistory;
    var treasury : Treasury;
};
```

The datastore types are:

```motoko
public type Users = HashMap.HashMap<Principal, User>;
public type CommentStore = HashMap.HashMap<CommentHash, Comment>;
public type CommentHistory = List.List<CommentHash>;
public type Treasury = Nat;
```

The hashmaps `Users` and `CommentStore` are [immutable variables](/common-programming-concepts/variables.html) in our `state` object. This means they hold a hashmap object with callable methods, but they cannot be replaced.

`CommentHistory` and `Treasury` on the other hand are [mutable variables](/common-programming-concepts/mutability.html). This means they hold a mutable variable that can be replaced with a new value. This happens when we deduct from the treasury or when we add a new comment to the comment history.

### Shared functions

The `main.mo` contains the [public API](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) of the actor. Most of the logic implementation for the shared functions is factored out to `Comments.mo` for clear code organization.

We only perform checks for the [identity of the caller](/internet-computer-programming-concepts/principals-and-authentication.html) and pass the datastores as arguments to the functions in `Comments.mo`.

### State mutations

The `state` object and its stores are only updated by functions in `Comments.mo`. The updates always occur within an [atomically executed](/advanced-concepts/async-programming.html) functions. The functions that update the state are `register`, `postComment` and `likeComment`.

Note that `register` always returns `QueryUser`, but `postComment` and `likeComment` return `PostResult` and `LikeResult`, which may return an error, see [`Result`](/base-library/utils/result.html).

`postResult` performs all the checks before any state is updated. If any check fails, the function returns an error and the state is not updated. If all checks pass, the function updates the state and returns the result. The response tells us whether the state was successfully updated or not.

`likeComment` returns `async* LikeResult`. The reason for this is that the function may `throw` an [`Error`](/advanced-concepts/async-programming.html) if any of its checks fail. (Errors can only be thrown in an asynchronous context).

Errors are only thrown in `likeComment` if something unexpected happens, like when a like is submitted to a comment which doesn't exist. Since the frontend is programmed to be able to do that, a call like that should never happen.

Recall that state updates up until an error are persisted in `async` and `async*` functions. In the case of `likeComment` the `users` hashmap may be updated before an `Error` but balances are only updated if all checks are met.

### Upgrading

The `state` object initialized in `main.mo` from [stable var arrays](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html) which are initially empty. The `state` object is used in working memory and filled with data when posts are made. The `state` object is not persisted during [upgrades](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html), so when the canister is upgraded, the data is lost.

Therefore, we use the `preupgrade` system function to copy all the data to the `stable` array variables before an upgrade. The datastores then are initialized again from the `stable` variables.

In the `postupgrade` system function, we empty out the `stable` arrays to save [memory](/internet-computer-programming-concepts/basic-memory-persistence.html).

> **NOTE**  
> _`preupgrade` and `postupgrade` system functions may trap during execution and data may be lost in the process. Work is underway to improve canister upgrades by working with [stable storage](/advanced-concepts/scalability/stable-storage.html)._

### Constants

All constants used in the project are defined in `Constants.mo`. This way, we can easily change the constants in one place and the changes are reflected throughout the project.

## DEMO
The comments canister is [live on mainnet](https://utymn-aaaaa-aaaal-qb5xq-cai.icp0.io/).