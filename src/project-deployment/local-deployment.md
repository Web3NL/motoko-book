# Local Deployment

We will setup a new project for a Motoko canister from scratch and demonstrate core functionality of the SDK. To deploy a "Hello World", you may consult the [official docs](https://internetcomputer.org/docs/current/developer-docs/setup/deploy-locally#create-a-new-project).

## `dfx` project from scratch

After [installing](/project-deployment/installing-sdk.html) the SDK you can make a new folder for your project. We will call our project `motime`. Make sure your project has the following folder structure:

```
motime
├── dfx.json
└── src/
    └── main.mo
```

### dfx.json

The main configuration file is `dfx.json`. Lets make a custom configuration for our project. Copy and paste the following into the `dfx.json` in the root of your project.

```json
{
  "canisters": {
    "motime": {
      "type": "motoko",
      "main": "src/main.mo"
    }
  }
}
```

This defines one single canister called `motime`. We specify that this [canister](/internet-computer-programming-concepts/actors/actor-to-canister.html) is based an [actor](/internet-computer-programming-concepts/actors.html) written in Motoko by setting `type` field to `"motoko"`. We also specify the Motoko file path in the `main` field.

This is enough for a basic canister build from one single Motoko source code file.

### main.mo

Inside the `src` folder, make a file called `main.mo` and put the following actor code inside.

```motoko
actor {
  public query func hello(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};
```

## Starting the local replica

After setting up project files, we need to start a local replica that serves as a local 'testnet' for development purposes. Start the replica by running

```bash
dfx start
```

Two things should be outputted in your terminal:

- An indication that [`networks.json`](/project-deployment/installing-sdk.html#step-3-configure-networksjson) is used
- A link to a locally running dashboard to monitor your replica

### Create empty canister

Now the local replica is running, lets create an empty canister.

```bash
dfx canister create motime
```

This creates a temporary `.dfx` folder in the root of your project. After this step, you should have a `canister_ids.json` under `.dfx/local/`. This file contains a _canister id_ (which is a [principal](/internet-computer-programming-concepts/principals-and-authentication.html)) of the empty canister now running on your local replica.

### Build Motoko code

Now we can compile the Motoko code into a [wasm file](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules) by running

```bash
dfx build motime
```

If the build succeeds, the outputs will be stored in `.dfx/local/canisters/motime/`. This folder contains, amongst other things, a `motime.wasm` file (the compiled Motoko actor) and a `motime.did` file (the [Interface Description](/internet-computer-programming-concepts/async-data/candid.html)).

### Installing the wasm in the canister

Now we can install the wasm module in the canister we created.

```bash
dfx canister install motime
```

If this succeeds, you now have a canister running on your local replica.

### Calling the canister

To interact with the running canister from the command line, run this command

```bash
dfx canister call motime hello motoko
```

The output should be `("Hello, motoko!")` indicating that the function inside `main.mo` was called successfully.

## `dfx deploy`

There is a command that combines the previous steps into one step. You need a running replica before running this command.

```bash
dfx deploy motime
```

This command creates a canister (if it doesn't exist already), compiles the code and installs the wasm module in one step.

> **NOTE**  
> _For a full overview of dfx commands, see the [official docs](https://internetcomputer.org/docs/current/references/cli-reference/)_
