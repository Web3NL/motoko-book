> **BETA WARNING** _This chapter is being reviewed and updated_

# Int8

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/int8/int8.mo:a}}
```

### On this page

### Constants

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

### Conversion

[Function `toInt`](#int8toint)  
[Function `toText`](#int8totext)  
[Function `fromInt`](#int8fromint)  
[Function `fromIntWrap`](#int8fromintwrap)  
[Function `fromNat8`](#int8fromnat8)  
[Function `toNat8`](#int8tonat8)

### Comparison

[Function `min`](#int8min)  
[Function `max`](#int8max)  
[Function `equal`](#int8equal)  
[Function `notEqual`](#int8notequal)  
[Function `less`](#int8less)  
[Function `lessOrEqual`](#int8lessorequal)  
[Function `greater`](#int8greater)  
[Function `greaterOrEqual`](#int8greaterorequal)  
[Function `compare`](#int8compare)

### Numerical Operations

[Function `abs`](#int8abs)  
[Function `neg`](#int8neg)  
[Function `add`](#int8add)  
[Function `sub`](#int8sub)  
[Function `mul`](#int8mul)  
[Function `div`](#int8div)  
[Function `rem`](#int8rem)  
[Function `pow`](#int8pow)

### Bitwise Operators

[Function `bitnot`](#int8bitnot)  
[Function `bitand`](#int8bitand)  
[Function `bitor`](#int8bitor)  
[Function `bitxor`](#int8bitxor)  
[Function `bitshiftLeft`](#int8bitshiftleft)  
[Function `bitshiftRight`](#int8bitshiftright)  
[Function `bitrotLeft`](#int8bitrotleft)  
[Function `bitrotRight`](#int8bitrotright)  
[Function `bittest`](#int8bittest)  
[Function `bitset`](#int8bitset)  
[Function `bitclear`](#int8bitclear)  
[Function `bitflip`](#int8bitflip)  
[Function `bitcountNonZero`](#int8bitcountnonzero)  
[Function `bitcountLeadingZero`](#int8bitcountleadingzero)  
[Function `bitcountTrailingZero`](#int8bitcounttrailingzero)

### Wrapping Operations

[Function `addWrap`](#int8addwrap)  
[Function `subWrap`](#int8subwrap)  
[Function `mulWrap`](#int8mulwrap)  
[Function `powWrap`](#int8powwrap)

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

The function `toInt` takes one `Int8` value and returns an `Int` value.

```motoko, run
{{#include _mo/int8/toInt.mo:a}}
```

## Int8.toText

```motoko
func toText(i : Int8) : Text
```

The function `toText` takes one `Int8` value and returns a `Text` value.

```motoko, run
{{#include _mo/int8/toText.mo:a}}
```

## Int8.fromInt

```motoko
 func fromInt(i : Int) : Int8
```

The function `fromInt` takes one `Int` value and returns an `Int8` value.

```motoko, run
{{#include _mo/int8/fromInt.mo:a}}
```

## Int8.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Int8
```

The function `fromIntWrap` takes one `Int` value and returns an `Int8` value.

```motoko, run
{{#include _mo/int8/fromIntWrap.mo:a}}
```

## Int8.fromNat8

```motoko
 func fromNat8(i : Nat8) : Int8
```

The function `fromNat8` takes one `Nat8` value and returns an `Int8` value.

```motoko, run
{{#include _mo/int8/fromNat8.mo:a}}
```

## Int8.toNat8

```motoko
 func toNat8(i : Int8) : Nat8
```

The function `toNat8` takes one `Int8` value and returns an `Nat8` value.

```motoko, run
{{#include _mo/int8/toNat8.mo:a}}
```

## Int8.min

```motoko
func min(x : Int8, y : Int8) : Int8
```

The function `min` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/min.mo:a}}
```

## Int8.max

```motoko
func max(x : Int8, y : Int8) : Int8
```

The function `max` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/max.mo:a}}
```

## Int8.equal

```motoko
func equal(x : Int8, y : Int8) : Bool
```

The function `equal` takes two `Int8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int8/equal.mo:a}}
```

## Int8.notEqual

```motoko
func notEqual(x : Int8, y : Int8) : Bool
```

The function `notEqual` takes two `Int8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int8/notEqual.mo:a}}
```

## Int8.less

```motoko
func less(x : Int8, y : Int8) : Bool
```

The function `less` takes two `Int8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int8/less.mo:a}}
```

## Int8.lessOrEqual

```motoko
func lessOrEqual(x : Int8, y : Int8) : Bool
```

The function `lessOrEqual` takes two `Int8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int8/lessOrEqual.mo:a}}
```

## Int8.greater

```motoko
func greater(x : Int8, y : Int8) : Bool
```

The function `greater` takes two `Int8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int8/greater.mo:a}}
```

## Int8.greaterOrEqual

```motoko
func greaterOrEqual(x : Int8, y : Int8) : Bool
```

The function `greaterOrEqual` takes two `Int8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int8/greaterOrEqual.mo:a}}
```

## Int8.compare

```motoko
func compare(x : Int8, y : Int8) : Bool
```

The function `compare` takes two `Int8` value and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/int8/compare.mo:a}}
```

## Int8.abs

```motoko
func abs(x : Int8) : Int8
```

The function `abs` takes one `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/abs.mo:a}}
```

## Int8.neg

```motoko
func neg(x : Int8) : Int8
```

The function `neg` takes one `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/neg.mo:a}}
```

## Int8.add

```motoko
func add(x : Int8, y : Int8) : Int8
```

The function `add` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/add.mo:a}}
```

## Int8.sub

```motoko
func sub(x : Int8, y : Int8) : Int8
```

The function `sub` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/sub.mo:a}}
```

## Int8.mul

```motoko
func mul(x : Int8, y : Int8) : Int8
```

The function `mul` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/mul.mo:a}}
```

## Int8.div

```motoko
func div(x : Int8, y : Int8) : Int8
```

The function `div` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/div.mo:a}}
```

## Int8.rem

```motoko
func rem(x : Int8, y : Int8) : Int8
```

The function `rem` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/rem.mo:a}}
```

## Int8.pow

```motoko
func pow(x : Int8, y : Int8) : Int8
```

The function `pow` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/pow.mo:a}}
```

## Int8.bitnot

```motoko
func bitnot(x : Int8) : Int8
```

The function `bitnot` takes one `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitnot.mo:a}}
```

## Int8.bitand

```motoko
func bitand(x : Int8, y : Int8) : Int8
```

The function `bitand` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitand.mo:a}}
```

## Int8.bitor

```motoko
func bitor(x : Int8, y : Int8) : Int8
```

The function `bitor` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitor.mo:a}}
```

## Int8.bitxor

```motoko
func bitxor(x : Int8, y : Int8) : Int8
```

The function `bitxor` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitxor.mo:a}}
```

## Int8.bitshiftLeft

```motoko
func bitshiftLeft(x : Int8, y : Int8) : Int8
```

The function `bitshiftLeft` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitshiftLeft.mo:a}}
```

## Int8.bitshiftRight

```motoko
func bitshiftRight(x : Int8, y : Int8) : Int8
```

The function `bitshiftRight` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitshiftRight.mo:a}}
```

## Int8.bitrotLeft

```motoko
func bitrotLeft(x : Int8, y : Int8) : Int8
```

The function `bitrotLeft` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitrotLeft.mo:a}}
```

## Int8.bitrotRight

```motoko
func bitrotRight(x : Int8, y : Int8) : Int8
```

The function `bitrotRight` takes two `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitrotRight.mo:a}}
```

## Int8.bittest

```motoko
func bittest(x : Int8, p : Nat) : Bool
```

The function `bittest` takes one `Int8` and one `Nat` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bittest.mo:a}}
```

## Int8.bitset

```motoko
func bitset(x : Int8, p : Nat) : Bool
```

The function `bitset` takes one `Int8` and one `Nat` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitset.mo:a}}
```

## Int8.bitclear

```motoko
func bitclear(x : Int8, p : Nat) : Bool
```

The function `bitclear` takes one `Int8` and one `Nat` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitclear.mo:a}}
```

## Int8.bitflip

```motoko
func bitflip(x : Int8, p : Nat) : Bool
```

The function `bitflip` takes one `Int8` and one `Nat` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitflip.mo:a}}
```

## Int8.bitcountNonZero

```motoko
let bitcountNonZero : (x : Int8) -> Int8
```

The function `bitcountNonZero` takes one `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitcountNonZero.mo:a}}
```

## Int8.bitcountLeadingZero

```motoko
let bitcountLeadingZero : (x : Int8) -> Int8
```

The function `bitcountLeadingZero` takes one `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitcountLeadingZero.mo:a}}
```

## Int8.bitcountTrailingZero

```motoko
let bitcountTrailingZero : (x : Int8) -> Int8
```

The function `bitcountTrailingZero` takes one `Int8` value and returns a `Int8` value.

```motoko, run
{{#include _mo/int8/bitcountTrailingZero.mo:a}}
```

## Int8.addWrap

```motoko
func addWrap(x : Int8, y : Int8) : Int8
```

The function `addWrap` takes two `Int8` value and returns a `Int8` value.It is equivalent to the `+%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-addition-).

```motoko, run
{{#include _mo/int8/addWrap.mo:a}}
```

## Int8.subWrap

```motoko
func subWrap(x : Int8, y : Int8) : Int8
```

The function `subWrap` takes two `Int8` value and returns a `Int8` value.It is equivalent to the `-%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-subtraction--).

```motoko, run
{{#include _mo/int8/subWrap.mo:a}}
```

## Int8.mulWrap

```motoko
func mulWrap(x : Int8, y : Int8) : Int8
```

The function `mulWrap` takes two `Int8` value and returns a `Int8` value.It is equivalent to the `*%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-multiplication-).

```motoko, run
{{#include _mo/int8/mulWrap.mo:a}}
```

## Int8.powWrap

```motoko
func powWrap(x : Int8, y : Int8) : Int8
```

The function `powWrap` takes two `Int8` value and returns a `Int8` value.It is equivalent to the `**%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-exponentiation-).

```motoko, run
{{#include _mo/int8/powWrap.mo:a}}
```
