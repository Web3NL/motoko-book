> **BETA WARNING** _This chapter is being reviewed and updated_

# Nat16

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/nat16/nat16.mo:a}}
```

### On this page

### Constants

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

### Conversion

[Function `toNat`](#nat16tonat)  
[Function `toText`](#nat16totext)  
[Function `fromNat`](#nat16fromnat)  
[Function `fromIntWrap`](#nat16fromintwrap)

### Comparison

[Function `min`](#nat16min)  
[Function `max`](#nat16max)  
[Function `equal`](#nat16equal)  
[Function `notEqual`](#nat16notequal)  
[Function `less`](#nat16less)  
[Function `lessOrEqual`](#nat16lessorequal)  
[Function `greater`](#nat16greater)  
[Function `greaterOrEqual`](#nat16greaterorequal)  
[Function `compare`](#nat16compare)

### Numerical Operations

[Function `add`](#nat16add)  
[Function `sub`](#nat16sub)  
[Function `mul`](#nat16mul)  
[Function `div`](#nat16div)  
[Function `rem`](#nat16rem)  
[Function `pow`](#nat16pow)

### Bitwise Operators

[Function `bitnot`](#nat16bitnot)  
[Function `bitand`](#nat16bitand)  
[Function `bitor`](#nat16bitor)  
[Function `bitxor`](#nat16bitxor)  
[Function `bitshiftLeft`](#nat16bitshiftleft)  
[Function `bitshiftRight`](#nat16bitshiftright)  
[Function `bitrotLeft`](#nat16bitrotleft)  
[Function `bitrotRight`](#nat16bitrotright)  
[Function `bittest`](#nat16bittest)  
[Function `bitset`](#nat16bitset)  
[Function `bitclear`](#nat16bitclear)  
[Function `bitflip`](#nat16bitflip)  
[Function `bitcountNonZero`](#nat16bitcountnonzero)  
[Function `bitcountLeadingZero`](#nat16bitcountleadingzero)  
[Function `bitcountTrailingZero`](#nat16bitcounttrailingzero)

### Wrapping Operations

[Function `addWrap`](#nat16addwrap)  
[Function `subWrap`](#nat16subwrap)  
[Function `mulWrap`](#nat16mulwrap)  
[Function `powWrap`](#nat16powwrap)

## minimumValue

```motoko
let minimumValue : Nat16 = 0;
```

## maximumValue

```motoko
let maximumValue : Nat16 = 65_535;
```

## Nat16.toNat

```motoko
 func toNat(i : Nat16) : Nat
```

The function `toNat` takes one `Nat16` value and returns a `Nat` value.

```motoko, run
{{#include _mo/nat16/toNat.mo:a}}
```

## Nat16.toText

```motoko
 func toText(i : Nat16) : Text
```

The function `toText` takes one `Nat16` value and returns a `Text` value.

```motoko, run
{{#include _mo/nat16/toText.mo:a}}
```

## Nat16.fromNat

```motoko
 func fromNat(i : Nat) : Nat16
```

The function `fromNat` takes one `Nat` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/fromNat.mo:a}}
```

## Nat16.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Nat
```

The function `fromIntWrap` takes one `Int` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/fromIntWrap.mo:a}}
```

## Nat16.min

```motoko
func min(x : Nat16, y : Nat16) : Nat16
```

The function `min` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/min.mo:a}}
```

## Nat16.max

```motoko
func max(x : Nat16, y : Nat16) : Nat16
```

The function `max` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/max.mo:a}}
```

## Nat16.equal

```motoko
func equal(x : Nat16, y : Nat16) : Bool
```

The function `equal` takes two `Nat16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat16/equal.mo:a}}
```

## Nat16.notEqual

```motoko
func notEqual(x : Nat16, y : Nat16) : Bool
```

The function `notEqual` takes two `Nat16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat16/notEqual.mo:a}}
```

## Nat16.less

```motoko
func less(x : Nat16, y : Nat16) : Bool
```

The function `less` takes two `Nat16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat16/less.mo:a}}
```

## Nat16.lessOrEqual

```motoko
func lessOrEqual(x : Nat16, y : Nat16) : Bool
```

The function `lessOrEqual` takes two `Nat16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat16/lessOrEqual.mo:a}}
```

## Nat16.greater

```motoko
func greater(x : Nat16, y : Nat16) : Bool
```

The function `greater` takes two `Nat16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat16/greater.mo:a}}
```

## Nat16.greaterOrEqual

```motoko
func greaterOrEqual(x : Nat16, y : Nat16) : Bool
```

The function `greaterOrEqual` takes two `Nat16` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat16/greaterOrEqual.mo:a}}
```

## Nat16.compare

```motoko
func compare(x : Nat16, y : Nat16) : Bool
```

The function `compare` takes two `Nat16` value and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/nat16/compare.mo:a}}
```

## Nat16.add

```motoko
func add(x : Nat16, y : Nat16) : Nat16
```

The function `add` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/add.mo:a}}
```

## Nat16.sub

```motoko
func sub(x : Nat16, y : Nat16) : Nat16
```

The function `sub` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/sub.mo:a}}
```

## Nat16.mul

```motoko
func mul(x : Nat16, y : Nat16) : Nat16
```

The function `mul` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/mul.mo:a}}
```

## Nat16.div

```motoko
func div(x : Nat16, y : Nat16) : Nat16
```

The function `div` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/div.mo:a}}
```

## Nat16.rem

```motoko
func rem(x : Nat16, y : Nat16) : Nat16
```

The function `rem` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/rem.mo:a}}
```

## Nat16.pow

```motoko
func pow(x : Nat16, y : Nat16) : Nat16
```

The function `pow` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/pow.mo:a}}
```

## Nat16.bitnot

```motoko
func bitnot(x : Nat16) : Nat16
```

The function `bitnot` takes one `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitnot.mo:a}}
```

## Nat16.bitand

```motoko
func bitand(x : Nat16, y : Nat16) : Nat16
```

The function `bitand` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitand.mo:a}}
```

## Nat16.bitor

```motoko
func bitor(x : Nat16, y : Nat16) : Nat16
```

The function `bitor` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitor.mo:a}}
```

## Nat16.bitxor

```motoko
func bitxor(x : Nat16, y : Nat16) : Nat16
```

The function `bitxor` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitxor.mo:a}}
```

## Nat16.bitshiftLeft

```motoko
func bitshiftLeft(x : Nat16, y : Nat16) : Nat16
```

The function `bitshiftLeft` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitshiftLeft.mo:a}}
```

## Nat16.bitshiftRight

```motoko
func bitshiftRight(x : Nat16, y : Nat16) : Nat16
```

The function `bitshiftRight` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitshiftRight.mo:a}}
```

## Nat16.bitrotLeft

```motoko
func bitrotLeft(x : Nat16, y : Nat16) : Nat16
```

The function `bitrotLeft` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitrotLeft.mo:a}}
```

## Nat16.bitrotRight

```motoko
func bitrotRight(x : Nat16, y : Nat16) : Nat16
```

The function `bitrotRight` takes two `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitrotRight.mo:a}}
```

## Nat16.bittest

```motoko
func bittest(x : Nat16, p : Nat) : Bool
```

The function `bittest` takes one `Nat16` and one `Nat` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bittest.mo:a}}
```

## Nat16.bitset

```motoko
func bitset(x : Nat16, p : Nat) : Bool
```

The function `bitset` takes one `Nat16` and one `Nat` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitset.mo:a}}
```

## Nat16.bitclear

```motoko
func bitclear(x : Nat16, p : Nat) : Bool
```

The function `bitclear` takes one `Nat16` and one `Nat` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitclear.mo:a}}
```

## Nat16.bitflip

```motoko
func bitflip(x : Nat16, p : Nat) : Bool
```

The function `bitflip` takes one `Nat16` and one `Nat` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitflip.mo:a}}
```

## Nat16.bitcountNonZero

```motoko
let bitcountNonZero : (x : Nat16) -> Nat16
```

The function `bitcountNonZero` takes one `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitcountNonZero.mo:a}}
```

## Nat16.bitcountLeadingZero

```motoko
let bitcountLeadingZero : (x : Nat16) -> Nat16
```

The function `bitcountLeadingZero` takes one `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitcountLeadingZero.mo:a}}
```

## Nat16.bitcountTrailingZero

```motoko
let bitcountTrailingZero : (x : Nat16) -> Nat16
```

The function `bitcountTrailingZero` takes one `Nat16` value and returns a `Nat16` value.

```motoko, run
{{#include _mo/nat16/bitcountTrailingZero.mo:a}}
```

## Nat16.addWrap

```motoko
func addWrap(x : Nat16, y : Nat16) : Nat16
```

The function `addWrap` takes two `Nat16` value and returns a `Nat16` value.It is equivalent to the `+%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-addition-).

```motoko, run
{{#include _mo/nat16/addWrap.mo:a}}
```

## Nat16.subWrap

```motoko
func subWrap(x : Nat16, y : Nat16) : Nat16
```

The function `subWrap` takes two `Nat16` value and returns a `Nat16` value.It is equivalent to the `-%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-subtraction--).

```motoko, run
{{#include _mo/nat16/subWrap.mo:a}}
```

## Nat16.mulWrap

```motoko
func mulWrap(x : Nat16, y : Nat16) : Nat16
```

The function `mulWrap` takes two `Nat16` value and returns a `Nat16` value.It is equivalent to the `*%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-multiplication-).

```motoko, run
{{#include _mo/nat16/mulWrap.mo:a}}
```

## Nat16.powWrap

```motoko
func powWrap(x : Nat16, y : Nat16) : Nat16
```

The function `powWrap` takes two `Nat16` value and returns a `Nat16` value.It is equivalent to the `**%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-exponentiation-).

```motoko, run
{{#include _mo/nat16/powWrap.mo:a}}
```
