# Nat32

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/nat32.mo:a}}
```

### On this page

[Type Nat32](#type)  
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toNat`](#nat32tonat)  
[Function `toText`](#nat32totext)  
[Function `fromNat`](#nat32fromnat)  
[Function `fromIntWrap`](#nat32fromintwrap)

## Type

```motoko
type Nat32 = Nat32.Nat32
```

## MinimumValue

```motoko
let minimumValue : Nat32 = 0;
```

## MaximumValue

```motoko
let maximumValue : Nat32 = 4,294,967,295;
```

## Nat32.toNat

```motoko
 func toNat(i : Nat32) : Nat
```
The function `toNat` takes one `Nat32` argument and returns a `Nat` value.

```motoko, run
{{#include _mo/nat32a.mo:a}}
```

## Nat32.toText

```motoko
 func toText(i : Nat32) : Text
```
The function `toText` takes one `Nat32` argument and returns a `Text` value.

```motoko, run
{{#include _mo/nat32b.mo:a}}
```

## Nat32.fromNat

```motoko
 func fromNat(i : Nat) : Nat32
```
The function `fromNat` takes one `Nat` argument and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32c.mo:a}}
```

## Nat32.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Nat32
```
The function `fromIntWrap` takes one `Int` argument and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32d.mo:a}}
```
