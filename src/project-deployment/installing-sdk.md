# Installing the SDK

The [SDK (Software Development Kit)](https://internetcomputer.org/docs/current/references/cli-reference/) or sometimes called the CDK (Canister Development Kit) is a command-line program (and related tools) that you can run on your personal computer to develop canisters on the Internet Computer (IC).

After installing, the main program you will use (to manage and deploy canisters from the command-line) is called `dfx`.

> **NOTE**  
> _As of April 2023: Work is underway for a Graphical User Interface for `dfx`_

> **NOTE**  
> _The [official docs](https://internetcomputer.org/docs/current/developer-docs/setup/install/) provide more information on installing the SDK on all platforms_

## Install steps

On Linux, MacOS or Windows WSL, we can install and configure the SDK in four steps.

### Step 1: Install

Run this script in the terminal:

```bash
sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
```

This will download and install the `dfx` binary in `/home/USER/bin`.

### Step 2: Add to PATH

Add the `/home/USER/bin` directory to your PATH variable by editing your `/home/USER/.bashrc` file. Add these lines to the end of `.bashrc.`

```bash
#DFX
export PATH="/home/xps/bin/:$PATH"
```

Then run this command to activate the previous step

```bash
source .bashrc
```

If everything went well, then you can check your installation with

```bash
dfx --version
```

This should print the version of `dfx` that is installed.

### Step 3: Configure networks.json

To configure the local and mainnet networks used by `dfx` create a `networks.json` file in `/home/USER/.config/dfx/networks.json` with the following

```json
{
  "local": {
    "bind": "127.0.0.1:8080",
    "type": "ephemeral",
    "replica": {
      "subnet_type": "application"
    }
  },
  "ic": {
    "providers": ["https://mainnet.dfinity.network"],
    "type": "persistent"
  }
}
```

### Step 4: Run for the first time

Now run `dfx` for the first time

```bash
dfx start
```

This should create a version cache for `dfx` located at `/home/USER/.cache/dfinity/versions/`

## Dependencies

For `dfx` to work correctly, you need to have [Node.js](https://nodejs.org/en/download/current) v16.0.0 (or higher) installed on your system.

## Uninstall

To uninstall `dfx` and related files you can run the `uninstall.sh` script. From your home directory run

```bash
 ./.cache/dfinity/uninstall.sh
```

> **NOTE**  
> _The [official docs](https://internetcomputer.org/docs/current/developer-docs/setup/install/) provide more information on installing the SDK on all platforms_
