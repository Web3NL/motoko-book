# Canister Calls

A _canister_ is an instance of an actor that runs on the Internet Computer (IC). The IC provides _system resources_ to the canister, like:

- Connectivity: A canister can receive inbound and make outbound _canister calls_.
- Memory: A canister has _main working memory_ and also has access to _stable memory_.
- Computation: The code running in a canister is executed by one processor thread.

## Canister calls

### Inbound call

An external _client_ can call a shared function of a running canister. The call can either result in a _reply_ or a _reject_. A client could be another canister or an external client outside the IC.

### Outbound call

A canister can make an outbound call to another canister or make a HTTP request to the Internet.
