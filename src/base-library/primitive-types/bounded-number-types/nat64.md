> **BETA WARNING** _This chapter is being reviewed and updated_

# Nat64

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/nat64.mo:a}}
```

### On this page

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

[Function `toNat`](#nat64tonat)  
[Function `toText`](#nat64totext)  
[Function `fromNat`](#nat64fromnat)  
[Function `fromIntWrap`](#nat64fromintwrap)

## minimumValue

```motoko
let minimumValue : Nat64 = 0;
```

## maximumValue

```motoko
let maximumValue : Nat64 = 18_446_744_073_709_551_615;
```

## Nat64.toNat

```motoko
 func toNat(i : Nat64) : Nat
```

The function `toNat` takes one `Nat64` argument and returns an `Nat` value.

```motoko, run
{{#include _mo/nat64a.mo:a}}
```

## Nat64.toText

```motoko
 func toText(i : Nat64) : Text
```

The function `toText` takes one `Nat64` argument and returns a `Text` value.

```motoko, run
{{#include _mo/nat64b.mo:a}}
```

## Nat64.fromNat

```motoko
 func fromNat(i : Nat) : Nat64
```

The function `fromNat` takes one `Nat` argument and returns an `Nat64` value.

```motoko, run
{{#include _mo/nat64c.mo:a}}
```

## Nat64.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Nat64
```

The function `fromIntWrap` takes one `Int` argument and returns an `Nat64` value.

```motoko, run
{{#include _mo/nat64d.mo:a}}
```
