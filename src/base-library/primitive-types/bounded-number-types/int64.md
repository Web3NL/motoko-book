> **BETA WARNING** _This chapter is being reviewed and updated_

# Int64

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/int64/int64.mo:a}}
```

### On this page

### Constants

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

### Conversion

[Function `toInt`](#int64toint)  
[Function `toText`](#int64totext)  
[Function `fromInt`](#int64fromint)  
[Function `fromIntWrap`](#int64fromintwrap)  
[Function `fromNat64`](#int64fromnat64)  
[Function `toNat64`](#int64tonat64)

### Comparison

[Function `min`](#int64min)  
[Function `max`](#int64max)  
[Function `equal`](#int64equal)  
[Function `notEqual`](#int64notequal)  
[Function `less`](#int64less)  
[Function `lessOrEqual`](#int64lessorequal)  
[Function `greater`](#int64greater)  
[Function `greaterOrEqual`](#int64greaterorequal)  
[Function `compare`](#int64compare)

### Numerical Operations

[Function `abs`](#int64abs)  
[Function `neg`](#int64neg)  
[Function `add`](#int64add)  
[Function `sub`](#int64sub)  
[Function `mul`](#int64mul)  
[Function `div`](#int64div)  
[Function `rem`](#int64rem)  
[Function `pow`](#int64pow)

### Bitwise Operators

[Function `bitnot`](#int64bitnot)  
[Function `bitand`](#int64bitand)  
[Function `bitor`](#int64bitor)  
[Function `bitxor`](#int64bitxor)  
[Function `bitshiftLeft`](#int64bitshiftleft)  
[Function `bitshiftRight`](#int64bitshiftright)  
[Function `bitrotLeft`](#int64bitrotleft)  
[Function `bitrotRight`](#int64bitrotright)  
[Function `bittest`](#int64bittest)  
[Function `bitset`](#int64bitset)  
[Function `bitclear`](#int64bitclear)  
[Function `bitflip`](#int64bitflip)  
[Function `bitcountNonZero`](#int64bitcountnonzero)  
[Function `bitcountLeadingZero`](#int64bitcountleadingzero)  
[Function `bitcountTrailingZero`](#int64bitcounttrailingzero)

### Wrapping Operations

[Function `addWrap`](#int64addwrap)  
[Function `subWrap`](#int64subwrap)  
[Function `mulWrap`](#int64mulwrap)  
[Function `powWrap`](#int64powwrap)

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

The function `toInt` takes one `Int64` value and returns an `Int` value.

```motoko, run
{{#include _mo/int64/toInt.mo:a}}
```

## Int64.toText

```motoko
 func toText(i : Int64) : Text
```

The function `toText` takes one `Int64` value and returns a `Text` value.

```motoko, run
{{#include _mo/int64/toText.mo:a}}
```

## Int64.fromInt

```motoko
 func fromInt(i : Int) : Int64
```

The function `fromInt` takes one `Int` value and returns an `Int64` value.

```motoko, run
{{#include _mo/int64/fromInt.mo:a}}
```

## Int64.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Int64
```

The function `fromIntWrap` takes one `Int` value and returns an `Int64` value.

```motoko, run
{{#include _mo/int64/fromIntWrap.mo:a}}
```

## Int64.fromNat64

```motoko
 func fromNat64(i : Nat64) : Int64
```

The function `fromNat64` takes one `Nat64` value and returns an `Int64` value.

```motoko, run
{{#include _mo/int64/fromNat64.mo:a}}
```

## Int64.toNat64

```motoko
 func toNat64(i : Int64) : Nat64
```

The function `toNat64` takes one `Int64` value and returns an `Nat64` value.

```motoko, run
{{#include _mo/int64/toNat64.mo:a}}
```

## Int64.min

```motoko
func min(x : Int64, y : Int64) : Int64
```

The function `min` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/min.mo:a}}
```

## Int64.max

```motoko
func max(x : Int64, y : Int64) : Int64
```

The function `max` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/max.mo:a}}
```

## Int64.equal

```motoko
func equal(x : Int64, y : Int64) : Bool
```

The function `equal` takes two `Int64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int64/equal.mo:a}}
```

## Int64.notEqual

```motoko
func notEqual(x : Int64, y : Int64) : Bool
```

The function `notEqual` takes two `Int64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int64/notEqual.mo:a}}
```

## Int64.less

```motoko
func less(x : Int64, y : Int64) : Bool
```

The function `less` takes two `Int64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int64/less.mo:a}}
```

## Int64.lessOrEqual

```motoko
func lessOrEqual(x : Int64, y : Int64) : Bool
```

The function `lessOrEqual` takes two `Int64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int64/lessOrEqual.mo:a}}
```

## Int64.greater

```motoko
func greater(x : Int64, y : Int64) : Bool
```

The function `greater` takes two `Int64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int64/greater.mo:a}}
```

## Int64.greaterOrEqual

```motoko
func greaterOrEqual(x : Int64, y : Int64) : Bool
```

The function `greaterOrEqual` takes two `Int64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/int64/greaterOrEqual.mo:a}}
```

## Int64.compare

```motoko
func compare(x : Int64, y : Int64) : Bool
```

The function `compare` takes two `Int64` value and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/int64/compare.mo:a}}
```

## Int64.abs

```motoko
func abs(x : Int64) : Int64
```

The function `abs` takes one `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/abs.mo:a}}
```

## Int64.neg

```motoko
func neg(x : Int64) : Int64
```

The function `neg` takes one `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/neg.mo:a}}
```

## Int64.add

```motoko
func add(x : Int64, y : Int64) : Int64
```

The function `add` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/add.mo:a}}
```

## Int64.sub

```motoko
func sub(x : Int64, y : Int64) : Int64
```

The function `sub` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/sub.mo:a}}
```

## Int64.mul

```motoko
func mul(x : Int64, y : Int64) : Int64
```

The function `mul` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/mul.mo:a}}
```

## Int64.div

```motoko
func div(x : Int64, y : Int64) : Int64
```

The function `div` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/div.mo:a}}
```

## Int64.rem

```motoko
func rem(x : Int64, y : Int64) : Int64
```

The function `rem` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/rem.mo:a}}
```

## Int64.pow

```motoko
func pow(x : Int64, y : Int64) : Int64
```

The function `pow` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/pow.mo:a}}
```

## Int64.bitnot

```motoko
func bitnot(x : Int64) : Int64
```

The function `bitnot` takes one `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitnot.mo:a}}
```

## Int64.bitand

```motoko
func bitand(x : Int64, y : Int64) : Int64
```

The function `bitand` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitand.mo:a}}
```

## Int64.bitor

```motoko
func bitor(x : Int64, y : Int64) : Int64
```

The function `bitor` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitor.mo:a}}
```

## Int64.bitxor

```motoko
func bitxor(x : Int64, y : Int64) : Int64
```

The function `bitxor` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitxor.mo:a}}
```

## Int64.bitshiftLeft

```motoko
func bitshiftLeft(x : Int64, y : Int64) : Int64
```

The function `bitshiftLeft` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitshiftLeft.mo:a}}
```

## Int64.bitshiftRight

```motoko
func bitshiftRight(x : Int64, y : Int64) : Int64
```

The function `bitshiftRight` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitshiftRight.mo:a}}
```

## Int64.bitrotLeft

```motoko
func bitrotLeft(x : Int64, y : Int64) : Int64
```

The function `bitrotLeft` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitrotLeft.mo:a}}
```

## Int64.bitrotRight

```motoko
func bitrotRight(x : Int64, y : Int64) : Int64
```

The function `bitrotRight` takes two `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitrotRight.mo:a}}
```

## Int64.bittest

```motoko
func bittest(x : Int64, p : Nat) : Bool
```

The function `bittest` takes one `Int64` and one `Nat` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bittest.mo:a}}
```

## Int64.bitset

```motoko
func bitset(x : Int64, p : Nat) : Bool
```

The function `bitset` takes one `Int64` and one `Nat` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitset.mo:a}}
```

## Int64.bitclear

```motoko
func bitclear(x : Int64, p : Nat) : Bool
```

The function `bitclear` takes one `Int64` and one `Nat` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitclear.mo:a}}
```

## Int64.bitflip

```motoko
func bitflip(x : Int64, p : Nat) : Bool
```

The function `bitflip` takes one `Int64` and one `Nat` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitflip.mo:a}}
```

## Int64.bitcountNonZero

```motoko
let bitcountNonZero : (x : Int64) -> Int64
```

The function `bitcountNonZero` takes one `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitcountNonZero.mo:a}}
```

## Int64.bitcountLeadingZero

```motoko
let bitcountLeadingZero : (x : Int64) -> Int64
```

The function `bitcountLeadingZero` takes one `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitcountLeadingZero.mo:a}}
```

## Int64.bitcountTrailingZero

```motoko
let bitcountTrailingZero : (x : Int64) -> Int64
```

The function `bitcountTrailingZero` takes one `Int64` value and returns a `Int64` value.

```motoko, run
{{#include _mo/int64/bitcountTrailingZero.mo:a}}
```

## Int64.addWrap

```motoko
func addWrap(x : Int64, y : Int64) : Int64
```

The function `addWrap` takes two `Int64` value and returns a `Int64` value.It is equivalent to the `+%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-addition-).

```motoko, run
{{#include _mo/int64/addWrap.mo:a}}
```

## Int64.subWrap

```motoko
func subWrap(x : Int64, y : Int64) : Int64
```

The function `subWrap` takes two `Int64` value and returns a `Int64` value.It is equivalent to the `-%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-subtraction--).

```motoko, run
{{#include _mo/int64/subWrap.mo:a}}
```

## Int64.mulWrap

```motoko
func mulWrap(x : Int64, y : Int64) : Int64
```

The function `mulWrap` takes two `Int64` value and returns a `Int64` value.It is equivalent to the `*%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-multiplication-).

```motoko, run
{{#include _mo/int64/mulWrap.mo:a}}
```

## Int64.powWrap

```motoko
func powWrap(x : Int64, y : Int64) : Int64
```

The function `powWrap` takes two `Int64` value and returns a `Int64` value.It is equivalent to the `**%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-exponentiation-).

```motoko, run
{{#include _mo/int64/powWrap.mo:a}}
```
