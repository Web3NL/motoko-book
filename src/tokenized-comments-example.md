# Tokenized Comments Example

This chapters demonstrates how one can reward user interaction with virtual tokens. Its a simple comment section where users (after logging in) can leave a comment and like other comments.

**The purpose is to demonstrate how to use common programming language features in Motoko.**

We use a virtual token with a capped supply, but we intentionally don't allow transfers. This way, the token can be used to reward users, but it can't be traded on exchanges.

> **WARNING**  
> _This is NOT a digital crypto currency. Tokens can not be sent. The tokenomics model is not economically sound. The model is for code writing demonstrations only._

> **NOTE**  
> _The token is not an [ICRC1] compliant token_

Rules are simple:
- You can only comment and like interact after logging in with [Internet Identity](https://identity.internetcomputer.org/).
- You may only comment once per 10 minutes and like once per minute.
- You earn 10 tokens for a posted comment
- You earn 1 token for every like you receive.

We start with a total supply of 10 000 tokens. When all tokens are given out, no more tokens can be earned.

## Project setup
The project is setup with the following files:
- `main.mo` contains the main actor, [datastores], [shared functions] and [system upgrade functions](#datastores-and-upgrading)
- `Constants.mo` contains the constants used in the project
- `Types.mo` contains the types used in the project
- `Utils.mo` contains utility functions used in the project
- `Comments.mo` contains the the implementations of the main shared functions

### Shared functions
The `main.mo` contains the [public API] of the actor. Most of the logic implementation for the shared functions is factored out to `Comments.mo` for clear code organization. 

We only perform checks for the [identity of the caller] and pass the datastores as arguments to the functions in `Comments.mo`. 

### Datastores and upgrading
We use four datastores:
- An array `[var Nat]` with one mutable element for the treasury.
- A `HashMap` for users
- A `HashMap` for comments
- A `List` for the comment history

The datastores are initialized from [stable var arrays] which are initially empty. The stores are used in working memory and filled with data when posts are made. These datastores are not persisted during [upgrades], so when the canister is upgraded, the data is lost.

Therefore, we use the `preupgrade` system function to copy all the data to the `stable` variables before an upgrade. The datastores then are initialized again from the `stable` variables. 

In the `postupgrade` system function, we empty out the `stable` arrays to save [memory].
