> **BETA WARNING** _This chapter is being reviewed and updated_

# Int8

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/int8.mo:a}}
```

### On this page

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

[Function `toInt`](#int8toint)  
[Function `toText`](#int8totext)  
[Function `fromInt`](#int8fromint)  
[Function `fromNat8`](#int8fromnat8)  
[Function `toNat8`](#int8tonat8)

## minimumValue

```motoko
let minimumValue : Int8 = -128
```

## maximumValue

```motoko
let maximumValue : Int8 = 127
```

## Int8.toInt

```motoko
 func toInt(i : Int8) : Int
```

The function `toInt` takes one `Int8` argument and returns an `Int` value.

```motoko, run
{{#include _mo/int8d.mo:a}}
```

## Int8.toText

```motoko
func toText(i : Int8) : Text
```

The function `toText` takes one `Int8` argument and returns a `Text` value.

```motoko, run
{{#include _mo/int8e.mo:a}}
```

## Int8.fromInt

```motoko
 func fromInt(i : Int) : Int8
```

The function `fromInt` takes one `Int` argument and returns an `Int8` value.

```motoko, run
{{#include _mo/int8a.mo:a}}
```

## Int8.fromNat8

```motoko
 func fromNat8(i : Nat8) : Int8
```

The function `fromNat8` takes one `Nat8` argument and returns an `Int8` value.

```motoko, run
{{#include _mo/int8b.mo:a}}
```

## Int8.toNat8

```motoko
 func toNat8(i : Int8) : Nat8
```

The function `toNat8` takes one `Int8` argument and returns an `Nat8` value.

```motoko, run
{{#include _mo/int8c.mo:a}}
```
