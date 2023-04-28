> **BETA WARNING** _This chapter is being reviewed and updated_

# Nat16

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/nat16.mo:a}}
```

### On this page

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

[Function `toNat`](#nat16tonat)  
[Function `toText`](#nat16totext)  
[Function `fromNat`](#nat16fromnat)  
[Function `fromIntWrap`](#nat16fromintwrap)

## minimumValue

```motoko
let minimumValue : Nat16 = 0;
```

## maximumValue

```motoko
let maximumValue : Nat16 = 65_535;
```

## Nat16.toNat

```motoko
 func toNat(i : Nat16) : Nat
```

The function `toNat` takes one `Nat16` argument and returns a `Nat` value.

```motoko, run
{{#include _mo/nat16a.mo:a}}
```

## Nat16.toText

```motoko
 func toText(i : Nat16) : Text
```

The function `toText` takes one `Nat16` argument and returns a `Text` value.

```motoko, run
{{#include _mo/nat16b.mo:a}}
```

## Nat16.fromNat

```motoko
 func fromNat(i : Nat) : Nat16
```

The function `fromNat` takes one `Nat` argument and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16c.mo:a}}
```

## Nat16.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Nat
```

The function `fromIntWrap` takes one `Int` argument and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16d.mo:a}}
```
