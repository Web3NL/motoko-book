# Identities and PEM Files

When we interact with the Internet Computer (IC), we use a [principal](/internet-computer-programming-concepts/principals-and-authentication.html) for authentication. In fact, a principal is just a _transformed_ version of a _public key_ that is derived from a _private key_ according to a Digital Signature Scheme.

> **NOTE**  
> _For more detailed information about [digital signatures](https://internetcomputer.org/docs/current/references/ic-interface-spec#ecdsa), consult the [IC Interface specification](https://internetcomputer.org/docs/current/references/ic-interface-spec)_

Users of applications on the IC, will typically use [Internet Identity](https://identity.ic0.app/about) (or some other authentication tool like a hardware of software wallet) to manage and store private keys and generate signatures to sign calls and authenticate to services.

As a developer and user of `dfx`, you will work with private keys directly. This maybe for testing purposes, where you might want to generate many private keys to emulate many identities, or for deployment purposes, where you may want to have several developer identities that you control, store and backup.

## Default identity in `dfx`

`dfx` automatically generates a _default private key_ and stores it in a file `.config/dfx/identity/default/identity.pem`. The private key inside looks like this:

```
-----BEGIN EC PRIVATE KEY-----
MHQCAQEEIA6ajHcVaiWbLxxDCZkgS/04sS/PuVvliY0DBHwAm4vfoAcGBSuBBAAK
oUQDQgAE2iARSkW7j/wK1HmW4x+PoSBU8XJzHBuPnf1YalhsW8EgVtCKwO15eTNI
PazRT3s7hSFMIccji9DJgJlpyJ8O4w==
-----END EC PRIVATE KEY-----
```

This private key is stored in either encrypted or unencrypted form on your hard disk. In the case of an encrypted private key, you need to enter a password each time you want to use the key. Otherwise, the private key is stored in 'raw' form. Be careful, this is very insecure!

## Generating a new identity

We can generate a new identity with `dfx` by running

```
dfx identity new NAME
```

where `NAME` is the new name for your new identity. You will be prompted for a password.

For development, it might be useful to have 'throw away keys' without a password for easy testing of `dfx` features. For this we could run

```
dfx identity new NAME --disable-encryption
```

This will immediately generate a new private key and store it in folder in `.config/dfx/identity/`.

## Managing identities

Once we have multiple identities, we can list them by running

```
dfx identity list
```

This gives us a list of identities that are stored in `.config/dfx/identity/`. The currently selected identity will have an asterisk `*`.

We could switch between them by running

```
dfx identity use NAME
```

where name is the identity we want to switch to.

## Anonymous identity

Besides the _default identity_ (which is unique), `dfx` also allows us to use the [_anonymous identity_](/internet-computer-programming-concepts/principals-and-authentication.html#anonymous-principal) to interact with our canisters. To switch to the anonymous identity we run

```
dfx identity use anonymous
```
