# Random

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#type-imports-and-renaming) it is defined in.

```motoko
{{#include _mo/random/random.mo:a}}
```

### On this page

[Class `Finite`](#class-finite)

[Function `blob`](#randomblob)  
[Function `byte`](#randombyte)  
[Function `coin`](#randomcoin)  
[Function `range`](#randomrange)  
[Function `binomial`](#randombinomial)  
[Function `byteFrom`](#randombytefrom)  
[Function `coinFrom`](#randomcoinfrom)  
[Function `rangeFrom`](#randomrangefrom)  
[Function `binomialFrom`](#randombinomialfrom)

## Randomness on the IC

The IC provides a source of randomness for use in canister smart contracts. For non-cryptographic use cases, it is relatively simple to use, but for cryptographic use case, some care is required, see the [Official Base Library Reference](https://internetcomputer.org/docs/current/motoko/main/base/Random) and the [Official Docs](https://internetcomputer.org/how-it-works/execution-layer/#random-number-generation) for more information.

To obtain random numbers you need a _source of entropy_. Entropy is represented as a 32 byte `Blob` value. You may provide your own entropy `Blob` as a seed for random numbers or request 'fresh' entropy from the IC. Requesting entropy from the IC can only be done from within a `shared` function.

After obtaining a blob of entropy, you may use the [`Finite`](#class-finite) class to instantiate an object with methods to 'draw' different forms of randomness, namely:

- A random `Nat8` value with [`byte`](#randombyte)
- A random `Bool` value with [`coin`](#randomcoin)
- A random `Nat` value within a (possibly) large range with [`range`](#randomrange)
- A random `Nat8` value of the number of heads in a series of `n` coin flips with [`binomial`](#randombinomial)

When your entropy is 'used up', the `Finite` class methods will return `null`.

Alternatively, you may use `byteFrom`, `coinFrom`, `rangeFrom` and `binomialFrom` to obtain a single random value from a given `Blob` seed.

## Class `Finite`

```motoko
class Finite(entropy : Blob)
```

## Random.blob

```motoko
func blob : shared () -> async Blob
```

## Random.byte

```motoko
func byte() : ?Nat8
```

## Random.coin

```motoko
func coin() : ?Bool
```

## Random.range

```motoko
func range(p : Nat8) : ?Nat
```

## Random.binomial

```motoko
func binomial(n : Nat8) : ?Nat8
```

## Random.byteFrom

```motoko
func byteFrom(seed : Blob) : Nat8
```

## Random.coinFrom

```motoko
func coinFrom(seed : Blob) : Bool
```

## Random.rangeFrom

```motoko
func rangeFrom(p : Nat8, seed : Blob) : Nat
```

## Random.binomialFrom

```motoko
func binomialFrom(n : Nat8, seed : Blob) : Nat8
```
