# From Actor to Canister

An actor is written in Motoko code. It defines _public functions_ that can be accessed from outside the Internet Computer. A [_client_](/internet-computer-programming-concepts/canister-calling.html), like a laptop or a mobile phone, can send a request over the internet to call one of the public functions defined in an actor.

Here is the code for _one_ actor defined in its own Motoko source file. It contains one public function.

```motoko
{{#include _mo/actor-to-canister.mo:a}}
```

We will _deploy_ this actor to the Internet Computer!

## Canister

A canister is like a home for an actor. It lives on the Internet Computer Blockchain. A canister is meant to 'host' actors and make their public functions available to other canisters and the wider Internet beyond the Internet Computer itself. A canister also provides [_memory_](/internet-computer-programming-concepts/basic-memory-persistence.html#canister-main-memory) that every actor needs to operate.

Each canister can host one actor. The [_public interface_](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) of the canister is defined by the [_actor type_](/internet-computer-programming-concepts/actors.html#actor-type) of the actor it hosts. The public interface is described using an [_Interface Definition Language_](/internet-computer-programming-concepts/async-data/shared-types.html). Every canister has a [unique id](/internet-computer-programming-concepts/principals-and-authentication.html).

## Code compiling and Wasm modules

Before an actor can be deployed to the Internet Computer, the Motoko code has to be _compiled_ into a special kind of code. Compilation transforms the Motoko code into code that can _run_ (be executed) on the Internet Computer. This code is called Webassembly bytecode. The bytecode is just a file on your computer called a _Wasm module_.

It is this Wasm module that gets _installed_ in a canister.

## Deployment steps

To go from Motoko code to a running canister on the IC, the following happens:

1. The Motoko code is _compiled_ into a _Wasm module_
2. An empty canister is registered on the Internet Computer
3. The Wasm module is uploaded to the canister

The public functions of the actor are now accessible on the Internet from any client!

## Motoko Playground

Currently (Jan 2023), there are two main tools to achieve the deployment steps. The more advanced one is the [Canister Development Kit](/project-deployment/installing-sdk.html) called DFX. For now, we will use a simpler tool called [_Motoko Playground_](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/).

The actor at the beginning of this chapter [is deployed](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/?tag=262732315) using Motoko Playground. To repeat the deployment for yourself, open the [this link](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/?tag=262732315) and do the following:

1. Check that there is one `Main.mo` file in the left side of the window
2. Check the Motoko actor code from this chapter
3. Click the blue `Deploy` button
4. In the popup window choose `Install`

The deployment steps will now take place and you can follow the process in the output `log`.

## Calling the actor from Motoko Playground

After the successful deployment of the actor in a new canister, we can now call our public function from the browser. On the right hand side of the window, there is a `Candid UI` with the name of our function `hello` and a button `QUERY`. Clicking the button returns the _return value_ of our function to the browser window.

The [next chapter](/internet-computer-programming-concepts/canister-calling.html) will explain what is actually happening when you interact with a canister from a browser.
