# Canister Calls from Clients
To call a public function of an actor, a message has to be sent over the internet to the Internet Computer Blockchain. This message contains the [canister id](/internet-computer-programming-concepts/principals-and-authentication.html), the name of the function to be called and the optional arguments for the function. The whole message is also *signed* by the sender.

There are several *libraries* for composing messages, sign them and send them in a [HTTP request](https://www.w3schools.com/tags/ref_httpmethods.asp) to the Internet Computer. The details of this mechanism and the libraries are outside the scope of this book, but we will mention them briefly to establish a general idea of how canister calls are achieved. 

## Canister Calls from a browser
The most common way to interact with an actor (hosted in a canister on the Internet Computer) is from a browser. Several [Typescript libraries](https://github.com/dfinity/agent-js) are available that facilitate the process of sending messages to canisters. 

In fact, this is exactly what the [Candid UI interface](/internet-computer-programming-concepts/actor-to-canister.html#calling-the-actor-from-motoko-playground) is doing when you call a function. Since Motoko Playground runs in the browser, it interacts with the Internet Computer by running Typescript code in the browser that uses the [Typescript libraries](https://github.com/dfinity/agent-js).

## Canister Calls from DFX
Another way to send messages is from a client computer that runs some program in stead of a browser. In fact any program that can access the Internet and issue [HTTP request](https://www.w3schools.com/tags/ref_httpmethods.asp) can send a message to a canister running on the IC.

One such program is called DFX, which is a [Canister Development Kit](/project-deployment.html). We will describe how to send messages to canisters from DFX in later chapters. 