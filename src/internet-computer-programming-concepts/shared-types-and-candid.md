# Shared Types and Candid
Actors expose [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) to the outside world. They define the *interface* for interacting with all Motoko programs running in [canisters](/internet-computer-programming-concepts/actor-to-canister.html) on the Internet Computer.

Incoming and outgoing data is defined by the *argument types* and *return types* of public shared functions inside actors. Incoming and outgoing data types are restricted to a subset of available Motoko types, called *shared types*. 

All shared types in Motoko have a corresponding *type description* in the 'outside world'. This type description defines the data type independently of Motoko or any other language. These alternative type descriptions are written in a special *Interface Description Language* called Candid.  