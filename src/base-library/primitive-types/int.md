# Int

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/int/int.mo:a}}
```

### Numerical operations

[Function `abs`](#intabs)  
[Function `neg`](#intneg)  
[Function `add`](#intadd)  
[Function `sub`](#intsub)  
[Function `mul`](#intmul)  
[Function `div`](#intdiv)  
[Function `rem`](#intrem)  
[Function `pow`](#intpow)

### Conversion

[Function `toText`](#inttotext)

### Comparison

[Function `min`](#intmin)  
[Function `max`](#intmax)  
[Function `equal`](#intequal)  
[Function `notEqual`](#intnotequal)  
[Function `less`](#intless)  
[Function `lessOrEqual`](#intlessorequal)  
[Function `greater`](#intgreater)  
[Function `greaterOrEqual`](#intgreaterorequal)  
[Function `compare`](#intcompare)

## Int.abs

```motoko
func abs(x : Int) : Nat
```

The function `abs` takes one `Int` value as a argument and returns a `Nat` value.

```motoko, run
{{#include _mo/int/int4.mo:a}}
```

## Int.neg

```motoko
func neg(x : Int) : Int
```

The function `neg` takes one `Int` value as a argument and returns an `Int` value.

```motoko, run
{{#include _mo/int/int12.mo:a}}
```

## Int.add

```motoko
func add(x : Int, y : Int) : Int
```

The function `add` takes two `Int` value as a argument and returns an `Int` value.

```motoko, run
{{#include _mo/int/int13.mo:a}}
```

## Int.sub

```motoko
func sub(x : Int, y : Int) : Int
```

The function `sub` takes two `Int` value as a argument and returns an `Int` value.

```motoko, run
{{#include _mo/int/int14.mo:a}}
```

## Int.mul

```motoko
func mul(x : Int, y : Int) : Int
```

The function `mul` takes two `Int` value as a argument and returns an `Int` value.

```motoko, run
{{#include _mo/int/int15.mo:a}}
```

## Int.div

```motoko
func div(x : Int, y : Int) : Int
```

The function `div` takes two `Int` value as a argument and returns an `Int` value.

```motoko, run
{{#include _mo/int/int16.mo:a}}
```

## Int.rem

```motoko
func rem(x : Int, y : Int) : Int
```

The function `rem` takes two `Int` value as a argument and returns an `Int` value.

```motoko, run
{{#include _mo/int/int17.mo:a}}
```

## Int.pow

```motoko
func pow(x : Int, y : Int) : Int
```

The function `pow` takes two `Int` as a argument and returns an `Int` value.

```motoko, run
{{#include _mo/int/int18.mo:a}}
```

## Int.toText

```motoko
func toText(x : Int) : Text
```

The function `toText` takes one `Int` value as a argument and returns a `Text` value.

```motoko, run
{{#include _mo/int/int3.mo:a}}
```

## Int.min

```motoko
func min(x : Int, y : Int) : Int
```

The function `min` takes two `Int` value as a arguments and returns an `Int` value.

```motoko, run
{{#include _mo/int/int5.mo:a}}
```

## Int.max

```motoko
func max(x : Int, y : Int) : Int
```

The function `max` takes two `Int` value as a arguments and returns an `Int` value.

```motoko, run
{{#include _mo/int/int1.mo:a}}
```

## Int.equal

```motoko
func equal(x : Int, y : Int) : Bool
```

The function `equal` takes two `Int` value as a arguments and returns an `Bool` value.

```motoko, run
{{#include _mo/int/int6.mo:a}}
```

## Int.notEqual

```motoko
func notEqual(x : Int, y : Int) : Bool
```

The function `notEqual` takes two `Int` value as a arguments and returns an `Bool` value.

```motoko, run
{{#include _mo/int/int7.mo:a}}
```

## Int.less

```motoko
func less(x : Int, y : Int) : Bool
```

The function `less` takes two `Int` value as a arguments and returns an `Bool` value.

```motoko, run
{{#include _mo/int/int8.mo:a}}
```

## Int.lessOrEqual

```motoko
func lessOrEqual(x : Int, y : Int) : Bool
```

The function `lessOrEqual` takes two `Int` value as a arguments and returns an `Bool` value.

```motoko, run
{{#include _mo/int/int9.mo:a}}
```

## Int.greater

```motoko
func greater(x : Int, y : Int) : Bool
```

The function `greater` takes two `Int` value as a arguments and returns an `Bool` value.

```motoko, run
{{#include _mo/int/int10.mo:a}}
```

## Int.greaterOrEqual

```motoko
func greaterOrEqual(x : Int, y : Int) : Bool
```

The function `greaterOrEqual` takes two `Int` value as a arguments and returns an `Bool` value.

```motoko, run
{{#include _mo/int/int11.mo:a}}
```

## Int.compare

```motoko,
func compare(x : Int, y : Int) : {#less; #equal; #greater}
```

The function `compare` takes two `Int` value as a arguments and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/int/int2.mo:a}}
```
