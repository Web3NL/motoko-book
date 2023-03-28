# Nat8

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/nat8.mo:a}}
```

### On this page

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

[Function `toNat`](#nat8tonat)  
[Function `toText`](#nat8totext)  
[Function `fromNat`](#nat8fromnat)  
[Function `fromIntWrap`](#nat8fromintwrap)

## minimumValue

```motoko
let minimumValue : Nat8 = 0
```

## maximumValue

```motoko
let maximumValue : Nat8 = 255
```

## Nat8.toNat

```motoko
 func toNat(i : Nat8) : Nat
```

The function `toNat` takes one `Nat8` argument and returns a `Nat` value.

```motoko, run
{{#include _mo/nat8a.mo:a}}
```

## Nat8.toText

```motoko
 func toText(i : Nat8) : Text
```

The function `toText` takes one `Nat8` argument and returns a `Text` value.

```motoko, run
{{#include _mo/nat8b.mo:a}}
```

## Nat8.fromNat

```motoko
 func fromNat(i : Nat) : Nat8
```

The function `fromNat` takes one `Nat` argument and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8c.mo:a}}
```

## Nat8.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Nat8
```

The function `fromIntWrap` takes one `Int` argument and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8d.mo:a}}
```
