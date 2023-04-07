> **BETA WARNING** _This chapter is being reviewed and updated_

# Int16

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/int16.mo:a}}
```

### On this page

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

[Function `toInt`](#int16toint)  
[Function `toText`](#int16totext)  
[Function `fromInt`](#int16fromint)  
[Function `fromNat16`](#int16fromnat16)  
[Function `toNat16`](#int16tonat16)

## minimumValue

```motoko
let minimumValue : Int16 = -32_768;
```

## maximumValue

```motoko
let maximumValue : Int16 = 32_767;
```

## Int16.toInt

```motoko
 func toInt(i : Int16) : Int
```

The function `toInt` takes one `Int16` argument and returns an `Int` value.

```motoko, run
{{#include _mo/int16d.mo:a}}
```

## Int16.toText

```motoko
 func toText(i : Int16) : Text
```

The function `toText` takes one `Int16` argument and returns a `Text` value.

```motoko, run
{{#include _mo/int16e.mo:a}}
```

## Int16.fromInt

```motoko
 func fromInt(i : Int) : Int16
```

The function `fromInt` takes one `Int` argument and returns an `Int16` value.

```motoko, run
{{#include _mo/int16a.mo:a}}
```

## Int16.fromNat16

```motoko
 func fromNat16(i : Nat16) : Int16
```

The function `fromNat16` takes one `Nat16` argument and returns an `Int16` value.

```motoko, run
{{#include _mo/int16b.mo:a}}
```

## Int16.toNat16

```motoko
 func toNat16(i : Int16) : Nat16
```

The function `toNat16` takes one `Int16` argument and returns an `Nat16` value.

```motoko, run
{{#include _mo/int16c.mo:a}}
```
