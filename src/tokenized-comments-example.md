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

The source code is [available here](https://github.com/Web3NL/motoko-book/tree/main/comments). The project consists of two canisters:

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

### Shared functions

The `main.mo` contains the [public API](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) of the actor. Most of the logic implementation for the shared functions is factored out to `Comments.mo` for clear code organization.

We only perform checks for the [identity of the caller](/internet-computer-programming-concepts/principals-and-authentication.html) and pass the datastores as arguments to the functions in `Comments.mo`.

### Datastores and upgrading

We use four datastores:

- An array `[var Nat]` with one mutable element for the treasury.
- A `HashMap` for users
- A `HashMap` for comments
- An array `[List<CommentHash>]` for the comment history

The datastores are initialized from [stable var arrays](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html) which are initially empty. The stores are used in working memory and filled with data when posts are made. These datastores are not persisted during [upgrades](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html), so when the canister is upgraded, the data is lost.

Therefore, we use the `preupgrade` system function to copy all the data to the `stable` variables before an upgrade. The datastores then are initialized again from the `stable` variables.

In the `postupgrade` system function, we empty out the `stable` arrays to save [memory](/internet-computer-programming-concepts/basic-memory-persistence.html).
