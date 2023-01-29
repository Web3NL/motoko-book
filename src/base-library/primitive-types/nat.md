# Nat
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/nat.mo:a}}
```

## Nat.toText
The function `toText` takes one `Nat` argument and returns a `Text` value.  

```motoko
{{#include _mo/nat.mo:b}}
```

## Nat.min
The function `min` takes two `Nat` arguments and returns the smallest value.  

```motoko
{{#include _mo/nat.mo:d}}
```

## Nat.max
The function `max` takes two `Nat` arguments and returns the largest value.  

```motoko
{{#include _mo/nat2.mo:a}}
```

## Nat.compare
The function `compare` takes two `Nat` arguments and returns an `Order` variant value.  

```motoko
{{#include _mo/nat3.mo:a}}
```