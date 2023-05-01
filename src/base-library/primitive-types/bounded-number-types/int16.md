> **BETA WARNING** _This chapter is being reviewed and updated_

# Int16

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/int16/int16.mo:a}}
```

### On this page

### Constants

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

### Conversion

[Function `toInt`](#int16toint)  
[Function `toText`](#int16totext)  
[Function `fromInt`](#int16fromint)  
[Function `fromIntWrap`](#int16fromintwrap)  
[Function `fromNat16`](#int16fromnat16)  
[Function `toNat16`](#int16tonat16)

### Comparison

[Function `min`](#int16min)  
[Function `max`](#int16max)  
[Function `equal`](#int16equal)  
[Function `notEqual`](#int16notequal)  
[Function `less`](#int16less)  
[Function `lessOrEqual`](#int16lessorequal)  
[Function `greater`](#int16greater)  
[Function `greaterOrEqual`](#int16greaterorequal)  
[Function `compare`](#int16compare)

### Numerical Operations

[Function `abs`](#int16abs)  
[Function `neg`](#int16neg)  
[Function `add`](#int16add)  
[Function `sub`](#int16sub)  
[Function `mul`](#int16mul)  
[Function `div`](#int16div)  
[Function `rem`](#int16rem)  
[Function `pow`](#int16pow)

### Bitwise Operators

[Function `bitnot`](#int16bitnot)  
[Function `bitand`](#int16bitand)  
[Function `bitor`](#int16bitor)  
[Function `bitxor`](#int16bitxor)  
[Function `bitshiftLeft`](#int16bitshiftleft)  
[Function `bitshiftRight`](#int16bitshiftright)  
[Function `bitrotLeft`](#int16bitrotleft)  
[Function `bitrotRight`](#int16bitrotright)  
[Function `bittest`](#int16bittest)  
[Function `bitset`](#int16bitset)  
[Function `bitclear`](#int16bitclear)  
[Function `bitflip`](#int16bitflip)  
[Function `bitcountNonZero`](#int16bitcountnonzero)  
[Function `bitcountLeadingZero`](#int16bitcountleadingzero)  
[Function `bitcountTrailingZero`](#int16bitcounttrailingzero)  

### Wrapping Operations
[Function `addWrap`](#int16addwrap)  
[Function `subWrap`](#int16subwrap)  
[Function `mulWrap`](#int16mulwrap)  
[Function `powWrap`](#int16powwrap)

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

The function `toInt` takes one `Int16` value and returns an `Int` value.

```motoko, run
{{#include _mo/int16/toInt.mo:a}}
```

## Int16.toText

```motoko
 func toText(i : Int16) : Text
```

The function `toText` takes one `Int16` value and returns a `Text` value.

```motoko, run
{{#include _mo/int16/toText.mo:a}}
```

## Int16.fromInt

```motoko
 func fromInt(i : Int) : Int16
```

The function `fromInt` takes one `Int` value and returns an `Int16` value.

```motoko, run
{{#include _mo/int16/fromInt.mo:a}}
```

## Int16.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Int16
```

The function `fromIntWrap` takes one `Int` value and returns an `Int16` value.

```motoko, run
{{#include _mo/int16/fromIntWrap.mo:a}}
```

## Int16.fromNat16

```motoko
 func fromNat16(i : Nat16) : Int16
```

The function `fromNat16` takes one `Nat16` value and returns an `Int16` value.

```motoko, run
{{#include _mo/int16/fromNat16.mo:a}}
```

## Int16.toNat16

```motoko
 func toNat16(i : Int16) : Nat16
```

The function `toNat16` takes one `Int16` value and returns an `Nat16` value.

```motoko, run
{{#include _mo/int16/toNat16.mo:a}}
```

## Int16.min

```motoko
func min(x : Int16, y : Int16) : Int16
```

The function `min` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/min.mo:a}}
```

## Int16.max

```motoko
func max(x : Int16, y : Int16) : Int16
```

The function `max` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/max.mo:a}}
```

## Int16.equal

```motoko
func equal(x : Int16, y : Int16) : Bool
```

The function `equal` takes two `Int16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int16/equal.mo:a}}
```

## Int16.notEqual

```motoko
func notEqual(x : Int16, y : Int16) : Bool
```

The function `notEqual` takes two `Int16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int16/notEqual.mo:a}}
```

## Int16.less

```motoko
func less(x : Int16, y : Int16) : Bool
```

The function `less` takes two `Int16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int16/less.mo:a}}
```

## Int16.lessOrEqual

```motoko
func lessOrEqual(x : Int16, y : Int16) : Bool
```

The function `lessOrEqual` takes two `Int16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int16/lessOrEqual.mo:a}}
```

## Int16.greater

```motoko
func greater(x : Int16, y : Int16) : Bool
```

The function `greater` takes two `Int16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int16/greater.mo:a}}
```

## Int16.greaterOrEqual

```motoko
func greaterOrEqual(x : Int16, y : Int16) : Bool
```

The function `greaterOrEqual` takes two `Int16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int16/greaterOrEqual.mo:a}}
```

## Int16.compare

```motoko
func compare(x : Int16, y : Int16) : Bool
```

The function `compare` takes two `Int16` value and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/int16/compare.mo:a}}
```

## Int16.abs

```motoko
func abs(x : Int16) : Int16
```

The function `abs` takes one `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/abs.mo:a}}
```

## Int16.neg

```motoko
func neg(x : Int16) : Int16
```

The function `neg` takes one `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/neg.mo:a}}
```

## Int16.add

```motoko
func add(x : Int16, y : Int16) : Int16
```

The function `add` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/add.mo:a}}
```

## Int16.sub

```motoko
func sub(x : Int16, y : Int16) : Int16
```

The function `sub` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/sub.mo:a}}
```

## Int16.mul

```motoko
func mul(x : Int16, y : Int16) : Int16
```

The function `mul` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/mul.mo:a}}
```

## Int16.div

```motoko
func div(x : Int16, y : Int16) : Int16
```

The function `div` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/div.mo:a}}
```

## Int16.rem

```motoko
func rem(x : Int16, y : Int16) : Int16
```

The function `rem` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/rem.mo:a}}
```

## Int16.pow

```motoko
func pow(x : Int16, y : Int16) : Int16
```

The function `pow` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/pow.mo:a}}
```

## Int16.bitnot

```motoko
func bitnot(x : Int16) : Int16
```

The function `bitnot` takes one `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitnot.mo:a}}
```

## Int16.bitand

```motoko
func bitand(x : Int16, y : Int16) : Int16
```

The function `bitand` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitand.mo:a}}
```

## Int16.bitor

```motoko
func bitor(x : Int16, y : Int16) : Int16
```

The function `bitor` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitor.mo:a}}
```

## Int16.bitxor

```motoko
func bitxor(x : Int16, y : Int16) : Int16
```

The function `bitxor` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitxor.mo:a}}
```

## Int16.bitshiftLeft

```motoko
func bitshiftLeft(x : Int16, y : Int16) : Int16
```

The function `bitshiftLeft` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitshiftLeft.mo:a}}
```

## Int16.bitshiftRight

```motoko
func bitshiftRight(x : Int16, y : Int16) : Int16
```

The function `bitshiftRight` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitshiftRight.mo:a}}
```

## Int16.bitrotLeft

```motoko
func bitrotLeft(x : Int16, y : Int16) : Int16
```

The function `bitrotLeft` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitrotLeft.mo:a}}
```

## Int16.bitrotRight

```motoko
func bitrotRight(x : Int16, y : Int16) : Int16
```

The function `bitrotRight` takes two `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitrotRight.mo:a}}
```

## Int16.bittest

```motoko
func bittest(x : Int16, p : Nat) : Bool
```

The function `bittest` takes one `Int16` and one `Nat` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bittest.mo:a}}
```

## Int16.bitset

```motoko
func bitset(x : Int16, p : Nat) : Bool
```

The function `bitset` takes one `Int16` and one `Nat` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitset.mo:a}}
```

## Int16.bitclear

```motoko
func bitclear(x : Int16, p : Nat) : Bool
```

The function `bitclear` takes one `Int16` and one `Nat` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitclear.mo:a}}
```

## Int16.bitflip

```motoko
func bitflip(x : Int16, p : Nat) : Bool
```

The function `bitflip` takes one `Int16` and one `Nat` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitflip.mo:a}}
```

## Int16.bitcountNonZero

```motoko
let bitcountNonZero : (x : Int16) -> Int16
```

The function `bitcountNonZero` takes one `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitcountNonZero.mo:a}}
```

## Int16.bitcountLeadingZero

```motoko
let bitcountLeadingZero : (x : Int16) -> Int16
```

The function `bitcountLeadingZero` takes one `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitcountLeadingZero.mo:a}}
```

## Int16.bitcountTrailingZero

```motoko
let bitcountTrailingZero : (x : Int16) -> Int16
```

The function `bitcountTrailingZero` takes one `Int16` value and returns a `Int16` value.

```motoko, run
{{#include _mo/int16/bitcountTrailingZero.mo:a}}
```

## Int16.addWrap

```motoko
func addWrap(x : Int16, y : Int16) : Int16
```

The function `addWrap` takes two `Int16` value and returns a `Int16` value.It is equivalent to the `+%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-addition-).

```motoko, run
{{#include _mo/int16/addWrap.mo:a}}
```

## Int16.subWrap

```motoko
func subWrap(x : Int16, y : Int16) : Int16
```

The function `subWrap` takes two `Int16` value and returns a `Int16` value.It is equivalent to the `-%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-subtraction--).

```motoko, run
{{#include _mo/int16/subWrap.mo:a}}
```

## Int16.mulWrap

```motoko
func mulWrap(x : Int16, y : Int16) : Int16
```

The function `mulWrap` takes two `Int16` value and returns a `Int16` value.It is equivalent to the `*%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-multiplication-).

```motoko, run
{{#include _mo/int16/mulWrap.mo:a}}
```

## Int16.powWrap

```motoko
func powWrap(x : Int16, y : Int16) : Int16
```

The function `powWrap` takes two `Int16` value and returns a `Int16` value.It is equivalent to the `**%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-exponentiation-).

```motoko, run
{{#include _mo/int16/powWrap.mo:a}}
```
