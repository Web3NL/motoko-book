# Int32

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/int32.mo:a}}
```

### On this page

[Type Int32](#type)  
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toInt`](#int32toint)  
[Function `toText`](#int32totext)  
[Function `fromInt`](#int32fromint)  
[Function `fromNat32`](#int32fromnat32)  
[Function `toNat32`](#int32tonat32)

## Type

```motoko
type Int32 = Int32.Int32
```

## MinimumValue

```motoko
let minimumValue : Int32 = -2147483648
```

## MaximumValue

```motoko
let maximumValue : Int32 = 2147483647
```

## Int32.toInt

```motoko
 func toInt(i : Int32) : Int
```

The function `toInt` takes one `Int32` argument and returns an `Int` value.

```motoko, run
{{#include _mo/int32d.mo:a}}
```

## Int32.toText

```motoko
 func toText(i : Int32) : Text
```

The function `toText` takes one `Int32` argument and returns a `Text` value.

```motoko, run
{{#include _mo/int32e.mo:a}}
```

## Int32.fromInt

```motoko
 func fromInt(i : Int) : Int32
```

The function `fromInt` takes one `Int` argument and returns an `Int32` value.

```motoko, run
{{#include _mo/int32a.mo:a}}
```

## Int32.fromNat32

```motoko
 func fromNat32(i : Nat32) : Int32
```

The function `fromNat32` takes one `Nat32` argument and returns an `Int32` value.

```motoko, run
{{#include _mo/int32b.mo:a}}
```

## Int32.toNat32

```motoko
 func toNat32(i : Int32) : Nat32
```

The function `toNat32` takes one `Int32` argument and returns an `Nat32` value.

```motoko, run
{{#include _mo/int32c.mo:a}}
```