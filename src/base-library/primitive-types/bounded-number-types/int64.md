> **BETA WARNING** _This chapter is being reviewed and updated_

# Int64

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/int64.mo:a}}
```

### On this page

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

[Function `toInt`](#int64toint)  
[Function `toText`](#int64totext)  
[Function `fromInt`](#int64fromint)  
[Function `fromNat64`](#int64fromnat64)  
[Function `toNat64`](#int64tonat64)

## minimumValue

```motoko
let minimumValue : Int64 = -9_223_372_036_854_775_808;
```

## maximumValue

```motoko
let maximumValue : Int64 = 9_223_372_036_854_775_807;
```

## Int64.toInt

```motoko
 func toInt(i : Int64) : Int
```

The function `toInt` takes one `Int64` argument and returns an `Int` value.

```motoko, run
{{#include _mo/int64d.mo:a}}
```

## Int64.toText

```motoko
 func toText(i : Int64) : Text
```

The function `toText` takes one `Int64` argument and returns a `Text` value.

```motoko, run
{{#include _mo/int64e.mo:a}}
```

## Int64.fromInt

```motoko
 func fromInt(i : Int) : Int64
```

The function `fromInt` takes one `Int` argument and returns an `Int64` value.

```motoko, run
{{#include _mo/int64a.mo:a}}
```

## Int64.fromNat64

```motoko
 func fromNat64(i : Nat64) : Int64
```

The function `fromNat64` takes one `Nat64` argument and returns an `Int64` value.

```motoko, run
{{#include _mo/int64b.mo:a}}
```

## Int64.toNat64

```motoko
 func toNat64(i : Int64) : Nat64
```

The function `toNat64` takes one `Int64` argument and returns an `Nat64` value.

```motoko, run
{{#include _mo/int64c.mo:a}}
```
