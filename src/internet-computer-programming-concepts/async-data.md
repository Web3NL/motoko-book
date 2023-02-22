# Async Data
[Actors](/internet-computer-programming-concepts/actors.html) expose [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) to the outside world and other canisters. They define the *interface* for interacting with all Motoko programs running in [canisters](/internet-computer-programming-concepts/actors/actor-to-canister.html) on the Internet Computer. Canisters can interact with other canisters or other [clients](http://localhost:3000/internet-computer-programming-concepts/actors/canister-calling.html) on the internet. This interaction always happens by *asynchronous* function calls.

This chapter explains what kind of data is allowed *in* and *out* of Motoko programs during calls to and from canisters. 

