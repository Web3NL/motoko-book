# Nat64

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/nat64.mo:a}}
```

### On this page

[Type Nat64](#type)  
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toNat`](#nat64tonat)  
[Function `toText`](#nat64totext)  
[Function `fromNat`](#nat64fromnat)  
[Function `fromIntWrap`](#nat64fromintwrap)

## Type

```motoko
type Nat64 = Nat64.Nat64
```

## MinimumValue

```motoko
let minimumValue : Nat64 = 0;

```

## MaximumValue

```motoko
let maximumValue : Nat64 = 18,446,744,073,709,551,615;

```

## Nat64.toNat

The function `toNat` takes one `Nat64` argument and returns an `Nat` value.

```motoko, run
{{#include _mo/nat64a.mo:a}}
```

## Nat64.toText

The function `toText` takes one `Nat64` argument and returns a `Text` value.

```motoko, run
{{#include _mo/nat64b.mo:a}}
```

## Nat64.fromNat

The function `fromNat` takes one `Nat` argument and returns an `Nat64` value.

```motoko, run
{{#include _mo/nat64c.mo:a}}
```

## Nat64.fromIntWrap

The function `fromIntWrap` takes one `Int` argument and returns an `Int` value.

```motoko, run
{{#include _mo/nat64d.mo:a}}
```
