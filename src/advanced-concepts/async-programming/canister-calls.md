# Canister Calls

### Inbound call

An external [_client_](/internet-computer-programming-concepts/actors/canister-calling.html) can call a [shared function](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) of a running [canister](/internet-computer-programming-concepts/actors/actor-to-canister.html#canister). The call can either result in a _reply_ or a _reject_. A client could be [another canister](/advanced-concepts/async-programming/async-and-await.html) or an [external client](/internet-computer-programming-concepts/actors/canister-calling.html) outside the IC.

### Outbound call

A canister can make an [outbound call to another canister](/advanced-concepts/async-programming/async-and-await.html) or make a HTTP request to the Internet.
