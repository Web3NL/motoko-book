> **BETA WARNING** _This chapter is being reviewed and updated_

# Float

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/float/float.mo:a}}
```

### Utility Functions

[Function `abs`](#floatabs)  
[Function `sqrt`](#floatsqrt)  
[Function `ceil`](#floatceil)  
[Function `floor`](#floatfloor)  
[Function `trunc`](#floattrunc)  
[Function `nearest`](#floatnearest)  
[Function `copySign`](#floatcopysign)  
[Function `min`](#floatmin)  
[Function `max`](#floatmax)

### Conversion

[Function `toInt`](#floattoint)  
[Function `fromInt`](#floatfromint)  
[Function `toText`](#floattotext)  
[Function `toInt64`](#floattoint64)  
[Function `fromInt64`](#floatfromint64)

### Comparison

[Function `equalWithin`](#floatequalwithin)  
[Function `notEqualWithin`](#floatnotequalwithin)  
[Function `less`](#floatless)  
[Function `lessOrEqual`](#floatlessorequal)  
[Function `greater`](#floatgreater)  
[Function `greaterOrEqual`](#floatgreaterorequal)  
[Function `compare`](#floatcompare)

### Numerical Operations

[Function `neg`](#floatneg)  
[Function `add`](#floatadd)  
[Function `sub`](#floatsub)  
[Function `mul`](#floatmul)  
[Function `div`](#floatdiv)  
[Function `rem`](#floatrem)  
[Function `pow`](#floatpow)

### Mathematical Operations

[Function `sin`](#floatsin)  
[Function `cos`](#floatcos)  
[Function `tan`](#floattan)  
[Function `arcsin`](#floatarcsin)  
[Function `arccos`](#floatarccos)  
[Function `arctan`](#floatarctan)  
[Function `arctan2`](#floatarctan2)  
[Function `exp`](#floatexp)  
[Function `log`](#floatlog)

## Float.abs

```motoko
func abs : (x : Float) -> Float
```

The function `abs` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/abs.mo:a}}
```

## Float.sqrt

```motoko
func sqrt : (x : Float) -> Float
```

The function `sqrt` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/sqrt.mo:a}}
```

## Float.ceil

```motoko
func ceil : (x : Float) -> Float
```

The function `ceil` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/ceil.mo:a}}
```

## Float.floor

```motoko
func floor : (x : Float) -> Float
```

The function `floor` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/floor.mo:a}}
```

## Float.trunc

```motoko
func trunc : (x : Float) -> Float
```

The function `trunc` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/trunc.mo:a}}
```

## Float.nearest

```motoko
func nearest : (x : Float) -> Float
```

The function `nearest` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/nearest.mo:a}}
```

## Float.copySign

```motoko
func copySign : (x : Float) -> Float
```

The function `copySign` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/copySign.mo:a}}
```

## Float.min

```motoko
let min : (x : Float, y : Float) -> Float
```

The function `min` takes two `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/min.mo:a}}
```

## Float.max

```motoko
let max : (x : Float, y : Float) -> Float
```

The function `max` takes two `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/max.mo:a}}
```

## Float.toInt

```motoko
func toInt : Float -> Int
```

The function `toInt` takes one `Float` value and returns an `Int` value.

```motoko, run
{{#include _mo/float/toInt.mo:a}}
```

## Float.fromInt

```motoko
func fromInt : Int -> Float
```

The function `fromInt` takes one `Int` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/fromInt.mo:a}}
```

## Float.toText

```motoko
func toText : Float -> Text
```

The function `toText` takes one `Float` value and returns a `Text` value.

```motoko, run
{{#include _mo/float/toText.mo:a}}
```

## Float.toInt64

```motoko
func toInt64 : Float -> Int64
```

The function `toInt64` takes one `Float` value and returns an `Int64` value.

```motoko, run
{{#include _mo/float/toInt64.mo:a}}
```

## Float.fromInt64

```motoko
func fromInt64 : Int64 -> Float
```

The function `fromInt64` takes one `Int64` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/fromInt64.mo:a}}
```

## Float.equalWithin

```motoko
func equalWithin(x : Float, y : Float, epsilon : Float) : Bool
```

The function `equalWithin` takes two `Float` and one `epsilon` value and returns a `Bool` value.

```motoko, run
{{#include _mo/float/equalWith.mo:a}}
```

## Float.notEqualWithin

```motoko
func notEqualWithin(x : Float, y : Float, epsilon : Float) : Bool
```

The function `notEqualWithin` takes two `Float` and one `epsilon` value and returns a `Bool` value.

```motoko, run
{{#include _mo/float/notEqualWith.mo:a}}
```

## Float.less

```motoko
func less(x : Float, y : Float) : Bool
```

The function `less` takes two `Float` value and returns a `Bool` value.

```motoko, run
{{#include _mo/float/less.mo:a}}
```

## Float.lessOrEqual

```motoko
func lessOrEqual(x : Float, y : Float) : Bool
```

The function `lessOrEqual` takes two `Float` value and returns a `Bool` value.

```motoko, run
{{#include _mo/float/lessOrEqual.mo:a}}
```

## Float.greater

```motoko
func greater(x : Float, y : Float) : Bool
```

The function `greater` takes two `Float` value and returns a `Bool` value.

```motoko, run
{{#include _mo/float/greater.mo:a}}
```

## Float.greaterOrEqual

```motoko
func greaterOrEqual(x : Float, y : Float) : Bool
```

The function `greaterOrEqual` takes two `Float` value and returns a `Bool` value.

```motoko, run
{{#include _mo/float/greaterOrEqual.mo:a}}
```

## Float.compare

```motoko
func compare(x : Float, y : Float) : {#less; #equal; #greater}
```

The function `compare` takes two `Float` value and returns an [Order](/base-library/utils/order.html) value.

```motoko, run
{{#include _mo/float/compare.mo:a}}
```

## Float.neg

```motoko
func neg(x : Float) : Float
```

The function `neg` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/neg.mo:a}}
```

## Float.add

```motoko
func add(x : Float, y : Float) : Float
```

The function `add` takes two `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/add.mo:a}}
```

## Float.sub

```motoko
func sub(x : Float, y : Float) : Float
```

The function `sub` takes two `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/sub.mo:a}}
```

## Float.mul

```motoko
func mul(x : Float, y : Float) : Float
```

The function `mul` takes two `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/mul.mo:a}}
```

## Float.div

```motoko
func div(x : Float, y : Float) : Float
```

The function `div` takes two `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/div.mo:a}}
```

## Float.rem

```motoko
func rem(x : Float, y : Float) : Float
```

The function `rem` takes two `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/rem.mo:a}}
```

## Float.pow

```motoko
func pow(x : Float, y : Float) : Float
```

The function `pow` takes two `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/pow.mo:a}}
```

## Float.sin

```motoko
func sin : (x : Float) -> Float
```

The function `sin` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/sin.mo:a}}
```

## Float.cos

```motoko
func cos : (x : Float) -> Float
```

The function `cos` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/cos.mo:a}}
```

## Float.tan

```motoko
func tan : (x : Float) -> Float
```

The function `tan` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/tan.mo:a}}
```

## Float.arcsin

```motoko
func arcsin : (x : Float) -> Float
```

The function `arcsin` takes one `Float` value and returns a `Float` value. for more explanation look for [official documentation](https://internetcomputer.org/docs/current/motoko/main/base/Float/#value-arcsin)

```motoko, run
{{#include _mo/float/arcsin.mo:a}}
```

## Float.arccos

```motoko
func arccos : (x : Float) -> Float
```

The function `arccos` takes one `Float` value and returns a `Float` value. for more explanation look for [official documentation](https://internetcomputer.org/docs/current/motoko/main/base/Float/#value-arccos)

```motoko, run
{{#include _mo/float/arccos.mo:a}}
```

## Float.arctan

```motoko
func arctan : (x : Float) -> Float
```

The function `arctan` takes one `Float` value and returns a `Float` value. for more explanation look for [official documentation](https://internetcomputer.org/docs/current/motoko/main/base/Float/#value-arctan)

```motoko, run
{{#include _mo/float/arctan.mo:a}}
```

## Float.arctan2

```motoko
func arctan2 : (y : Float, x : Float) -> Float
```

The function `arctan2` takes two `Float` value and returns a `Float` value. for more explanation look for [official documentation](https://internetcomputer.org/docs/current/motoko/main/base/Float/#value-arctan2)

```motoko, run
{{#include _mo/float/arctan2.mo:a}}
```

## Float.exp

```motoko
func exp : (x : Float) -> Float
```

The function `exp` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/exp.mo:a}}
```

## Float.log

```motoko
func log : (x : Float) -> Float
```

The function `log` takes one `Float` value and returns a `Float` value.

```motoko, run
{{#include _mo/float/log.mo:a}}
```
