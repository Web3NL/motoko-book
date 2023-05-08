# Random

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

## Class `Finite`

```motoko
class Finite(entropy : Blob)
```

## Random.Blob

```motoko
func blob : shared () -> async Blob
```

```motoko
{{#include _mo/random/blob.mo:a}}
```

## Random.byte

```motoko
func byte() : ?Nat8
```

```motoko
{{#include _mo/random/byte.mo:a}}
```

## Random.coin

```motoko
func coin() : ?Bool
```

```motoko
{{#include _mo/random/coin.mo:a}}
```

## Random.range

```motoko
func range(p : Nat8) : ?Nat
```

```motoko
{{#include _mo/random/range.mo:a}}
```

## Random.binomial

```motoko
func binomial(n : Nat8) : ?Nat8
```

```motoko
{{#include _mo/random/binomial.mo:a}}
```

## Random.byteFrom

```motoko
func byteFrom(seed : Blob) : Nat8
```

```motoko
{{#include _mo/random/byteFrom.mo:a}}
```

## Random.coinFrom

```motoko
func coinFrom(seed : Blob) : Bool
```

```motoko
{{#include _mo/random/coinFrom.mo:a}}
```

## Random.rangeFrom

```motoko
func rangeFrom(p : Nat8, seed : Blob) : Nat
```

```motoko
{{#include _mo/random/rangeFrom.mo:a}}
```

## Random.binomialFrom

```motoko
func binomialFrom(n : Nat8, seed : Blob) : Nat8
```

```motoko
{{#include _mo/random/binomialFrom.mo:a}}
```
