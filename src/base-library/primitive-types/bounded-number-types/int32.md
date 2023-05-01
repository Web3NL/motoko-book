> **BETA WARNING** _This chapter is being reviewed and updated_

# Int32

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/int32/int32.mo:a}}
```

### On this page

### Constants

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

### Conversion

[Function `toInt`](#int32toint)  
[Function `toText`](#int32totext)  
[Function `fromInt`](#int32fromint)  
[Function `fromIntWrap`](#int32fromintwrap)  
[Function `fromNat32`](#int32fromnat32)  
[Function `toNat32`](#int32tonat32)

### Comparison

[Function `min`](#int32min)  
[Function `max`](#int32max)  
[Function `equal`](#int32equal)  
[Function `notEqual`](#int32notequal)  
[Function `less`](#int32less)  
[Function `lessOrEqual`](#int32lessorequal)  
[Function `greater`](#int32greater)  
[Function `greaterOrEqual`](#int32greaterorequal)  
[Function `compare`](#int32compare)

### Numerical Operations

[Function `abs`](#int32abs)  
[Function `neg`](#int32neg)  
[Function `add`](#int32add)  
[Function `sub`](#int32sub)  
[Function `mul`](#int32mul)  
[Function `div`](#int32div)  
[Function `rem`](#int32rem)  
[Function `pow`](#int32pow)

### Bitwise Operators

[Function `bitnot`](#int32bitnot)  
[Function `bitand`](#int32bitand)  
[Function `bitor`](#int32bitor)  
[Function `bitxor`](#int32bitxor)  
[Function `bitshiftLeft`](#int32bitshiftleft)  
[Function `bitshiftRight`](#int32bitshiftright)  
[Function `bitrotLeft`](#int32bitrotleft)  
[Function `bitrotRight`](#int32bitrotright)  
[Function `bittest`](#int32bittest)  
[Function `bitset`](#int32bitset)  
[Function `bitclear`](#int32bitclear)  
[Function `bitflip`](#int32bitflip)  
[Function `bitcountNonZero`](#int32bitcountnonzero)  
[Function `bitcountLeadingZero`](#int32bitcountleadingzero)  
[Function `bitcountTrailingZero`](#int32bitcounttrailingzero)  

### Wrapping Operations
[Function `addWrap`](#int32addwrap)  
[Function `subWrap`](#int32subwrap)  
[Function `mulWrap`](#int32mulwrap)  
[Function `powWrap`](#int32powwrap)

## minimumValue

```motoko
let minimumValue : Int32 = -2_147_483_648
```

## maximumValue

```motoko
let maximumValue : Int32 = 2_147_483_647
```

## Int32.toInt

```motoko
 func toInt(i : Int32) : Int
```

The function `toInt` takes one `Int32` value and returns an `Int` value.

```motoko, run
{{#include _mo/int32/toInt.mo:a}}
```

## Int32.toText

```motoko
 func toText(i : Int32) : Text
```

The function `toText` takes one `Int32` value and returns a `Text` value.

```motoko, run
{{#include _mo/int32/toText.mo:a}}
```

## Int32.fromInt

```motoko
 func fromInt(i : Int) : Int32
```

The function `fromInt` takes one `Int` value and returns an `Int32` value.

```motoko, run
{{#include _mo/int32/fromInt.mo:a}}
```

## Int32.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Int32
```

The function `fromIntWrap` takes one `Int` value and returns an `Int32` value.

```motoko, run
{{#include _mo/int32/fromIntWrap.mo:a}}
```

## Int32.fromNat32

```motoko
 func fromNat32(i : Nat32) : Int32
```

The function `fromNat32` takes one `Nat32` value and returns an `Int32` value.

```motoko, run
{{#include _mo/int32/fromNat32.mo:a}}
```

## Int32.toNat32

```motoko
 func toNat32(i : Int32) : Nat32
```

The function `toNat32` takes one `Int32` value and returns an `Nat32` value.

```motoko, run
{{#include _mo/int32/toNat32.mo:a}}
```

## Int32.min

```motoko
func min(x : Int32, y : Int32) : Int32
```

The function `min` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/min.mo:a}}
```

## Int32.max

```motoko
func max(x : Int32, y : Int32) : Int32
```

The function `max` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/max.mo:a}}
```

## Int32.equal

```motoko
func equal(x : Int32, y : Int32) : Bool
```

The function `equal` takes two `Int32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int32/equal.mo:a}}
```

## Int32.notEqual

```motoko
func notEqual(x : Int32, y : Int32) : Bool
```

The function `notEqual` takes two `Int32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int32/notEqual.mo:a}}
```

## Int32.less

```motoko
func less(x : Int32, y : Int32) : Bool
```

The function `less` takes two `Int32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int32/less.mo:a}}
```

## Int32.lessOrEqual

```motoko
func lessOrEqual(x : Int32, y : Int32) : Bool
```

The function `lessOrEqual` takes two `Int32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int32/lessOrEqual.mo:a}}
```

## Int32.greater

```motoko
func greater(x : Int32, y : Int32) : Bool
```

The function `greater` takes two `Int32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int32/greater.mo:a}}
```

## Int32.greaterOrEqual

```motoko
func greaterOrEqual(x : Int32, y : Int32) : Bool
```

The function `greaterOrEqual` takes two `Int32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int32/greaterOrEqual.mo:a}}
```

## Int32.compare

```motoko
func compare(x : Int32, y : Int32) : Bool
```

The function `compare` takes two `Int32` value and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/int32/compare.mo:a}}
```

## Int32.abs

```motoko
func abs(x : Int32) : Int32
```

The function `abs` takes one `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/abs.mo:a}}
```

## Int32.neg

```motoko
func neg(x : Int32) : Int32
```

The function `neg` takes one `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/neg.mo:a}}
```

## Int32.add

```motoko
func add(x : Int32, y : Int32) : Int32
```

The function `add` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/add.mo:a}}
```

## Int32.sub

```motoko
func sub(x : Int32, y : Int32) : Int32
```

The function `sub` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/sub.mo:a}}
```

## Int32.mul

```motoko
func mul(x : Int32, y : Int32) : Int32
```

The function `mul` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/mul.mo:a}}
```

## Int32.div

```motoko
func div(x : Int32, y : Int32) : Int32
```

The function `div` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/div.mo:a}}
```

## Int32.rem

```motoko
func rem(x : Int32, y : Int32) : Int32
```

The function `rem` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/rem.mo:a}}
```

## Int32.pow

```motoko
func pow(x : Int32, y : Int32) : Int32
```

The function `pow` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/pow.mo:a}}
```

## Int32.bitnot

```motoko
func bitnot(x : Int32) : Int32
```

The function `bitnot` takes one `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitnot.mo:a}}
```

## Int32.bitand

```motoko
func bitand(x : Int32, y : Int32) : Int32
```

The function `bitand` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitand.mo:a}}
```

## Int32.bitor

```motoko
func bitor(x : Int32, y : Int32) : Int32
```

The function `bitor` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitor.mo:a}}
```

## Int32.bitxor

```motoko
func bitxor(x : Int32, y : Int32) : Int32
```

The function `bitxor` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitxor.mo:a}}
```

## Int32.bitshiftLeft

```motoko
func bitshiftLeft(x : Int32, y : Int32) : Int32
```

The function `bitshiftLeft` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitshiftLeft.mo:a}}
```

## Int32.bitshiftRight

```motoko
func bitshiftRight(x : Int32, y : Int32) : Int32
```

The function `bitshiftRight` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitshiftRight.mo:a}}
```

## Int32.bitrotLeft

```motoko
func bitrotLeft(x : Int32, y : Int32) : Int32
```

The function `bitrotLeft` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitrotLeft.mo:a}}
```

## Int32.bitrotRight

```motoko
func bitrotRight(x : Int32, y : Int32) : Int32
```

The function `bitrotRight` takes two `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitrotRight.mo:a}}
```

## Int32.bittest

```motoko
func bittest(x : Int32, p : Nat) : Bool
```

The function `bittest` takes one `Int32` and one `Nat` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bittest.mo:a}}
```

## Int32.bitset

```motoko
func bitset(x : Int32, p : Nat) : Bool
```

The function `bitset` takes one `Int32` and one `Nat` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitset.mo:a}}
```

## Int32.bitclear

```motoko
func bitclear(x : Int32, p : Nat) : Bool
```

The function `bitclear` takes one `Int32` and one `Nat` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitclear.mo:a}}
```

## Int32.bitflip

```motoko
func bitflip(x : Int32, p : Nat) : Bool
```

The function `bitflip` takes one `Int32` and one `Nat` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitflip.mo:a}}
```

## Int32.bitcountNonZero

```motoko
let bitcountNonZero : (x : Int32) -> Int32
```

The function `bitcountNonZero` takes one `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitcountNonZero.mo:a}}
```

## Int32.bitcountLeadingZero

```motoko
let bitcountLeadingZero : (x : Int32) -> Int32
```

The function `bitcountLeadingZero` takes one `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitcountLeadingZero.mo:a}}
```

## Int32.bitcountTrailingZero

```motoko
let bitcountTrailingZero : (x : Int32) -> Int32
```

The function `bitcountTrailingZero` takes one `Int32` value and returns a `Int32` value.

```motoko, run
{{#include _mo/int32/bitcountTrailingZero.mo:a}}
```

## Int32.addWrap

```motoko
func addWrap(x : Int32, y : Int32) : Int32
```

The function `addWrap` takes two `Int32` value and returns a `Int32` value.It is equivalent to the `+%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-addition-).

```motoko, run
{{#include _mo/int32/addWrap.mo:a}}
```

## Int32.subWrap

```motoko
func subWrap(x : Int32, y : Int32) : Int32
```

The function `subWrap` takes two `Int32` value and returns a `Int32` value.It is equivalent to the `-%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-subtraction--).

```motoko, run
{{#include _mo/int32/subWrap.mo:a}}
```

## Int32.mulWrap

```motoko
func mulWrap(x : Int32, y : Int32) : Int32
```

The function `mulWrap` takes two `Int32` value and returns a `Int32` value.It is equivalent to the `*%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-multiplication-).

```motoko, run
{{#include _mo/int32/mulWrap.mo:a}}
```

## Int32.powWrap

```motoko
func powWrap(x : Int32, y : Int32) : Int32
```

The function `powWrap` takes two `Int32` value and returns a `Int32` value.It is equivalent to the `**%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-exponentiation-).

```motoko, run
{{#include _mo/int32/powWrap.mo:a}}
```
