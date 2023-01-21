# From Actor to Canister

An actor is written in Motoko code. It defines *public functions* that can be accessed from outside the Internet Computer. A [*client*](/internet-computer-programming-concepts/canister-calling.html), like a laptop or a mobile phone, can send a request over the internet to call one of the public functions defined in an actor.  

Here is the code for *one* actor defined in its own Motoko source file. It contains one public function. 

```motoko
{{#include _mo/actor-to-canister.mo:a}}
```

We will *deploy* this actor to the Internet Computer!

## Canister
A canister is like a home for an actor. It lives on the Internet Computer Blockchain. A canister is meant to 'host' actors and make their public functions available to the wider Internet beyond the Internet Computer itself. 

Each canister can host one actor. The *public interface* of the canister is defined by the [*actor type*](/internet-computer-programming-concepts/actors.html#actor-type) of the actor it hosts. The public interface is described using an [*Interface Definition Language*](/internet-computer-programming-concepts/candid.html). Every canister has a [unique id](/internet-computer-programming-concepts/principals-and-authentication.html).

## Code compiling and Wasm modules
Before an actor can be deployed to the Internet Computer, the Motoko code has to be *compiled* into a special kind of code. Compilation transforms the Motoko code into code that can *run* (be executed) on the Internet Computer. This code is called Webassembly bytecode. The bytecode is just a file on your computer called a *Wasm module*.

It is this Wasm module that gets *installed* in a canister. 

## Deployment steps
To go from Motoko code to a running canister on the IC, the following happens:
1. The Motoko code is *compiled* into a *Wasm module*
2. An empty canister is registered on the Internet Computer
3. The Wasm module is uploaded to the canister

The public functions of the actor are now accessible on the Internet from any client!

## Motoko Playground
Currently (Jan 2023), there are two main tools to achieve the deployment steps. The more advanced one is the [Canister Development Kit](/project-deployment/installing-sdk.html) called DFX. For now, we will use a simpler tool called [*Motoko Playground*](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/).

The actor at the beginning of this chapter [is deployed](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/?tag=262732315) using Motoko Playground. To repeat the deployment for yourself, open the [this link](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/?tag=262732315) and do the following: 

1. Check that there is one `Main.mo` file in the left side of the window
2. Check the Motoko actor code from this chapter
3. Click the blue `Deploy` button
4. In the popup window choose `Install`

The deployment steps will now take place and you can follow the process in the output `log`. 

## Calling the actor from Motoko Playground
After the successful deployment of the actor in a new canister, we can now call our public function from the browser. On the right hand side of the window, there is a `Candid UI` with the name of our function `hello` and a button `QUERY`. Clicking the button returns the *return value* of our function to the browser window. 

The [next chapter](/internet-computer-programming-concepts/canister-calling.html) will explain what is actually happening when you interact with a canister from a browser. 


