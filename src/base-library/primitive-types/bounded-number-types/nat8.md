> **BETA WARNING** _This chapter is being reviewed and updated_

# Nat8

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/nat8/nat8.mo:a}}
```

### On this page

### Constants

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

### Conversion

[Function `toNat`](#nat8tonat)  
[Function `toText`](#nat8totext)  
[Function `fromNat`](#nat8fromnat)  
[Function `fromIntWrap`](#nat8fromintwrap)

### Comparison

[Function `min`](#nat8min)  
[Function `max`](#nat8max)  
[Function `equal`](#nat8equal)  
[Function `notEqual`](#nat8notequal)  
[Function `less`](#nat8less)  
[Function `lessOrEqual`](#nat8lessorequal)  
[Function `greater`](#nat8greater)  
[Function `greaterOrEqual`](#nat8greaterorequal)  
[Function `compare`](#nat8compare)

### Numerical Operations

[Function `add`](#nat8add)  
[Function `sub`](#nat8sub)  
[Function `mul`](#nat8mul)  
[Function `div`](#nat8div)  
[Function `rem`](#nat8rem)  
[Function `pow`](#nat8pow)

### Bitwise Operators

[Function `bitnot`](#nat8bitnot)  
[Function `bitand`](#nat8bitand)  
[Function `bitor`](#nat8bitor)  
[Function `bitxor`](#nat8bitxor)  
[Function `bitshiftLeft`](#nat8bitshiftleft)  
[Function `bitshiftRight`](#nat8bitshiftright)  
[Function `bitrotLeft`](#nat8bitrotleft)  
[Function `bitrotRight`](#nat8bitrotright)  
[Function `bittest`](#nat8bittest)  
[Function `bitset`](#nat8bitset)  
[Function `bitclear`](#nat8bitclear)  
[Function `bitflip`](#nat8bitflip)  
[Function `bitcountNonZero`](#nat8bitcountnonzero)  
[Function `bitcountLeadingZero`](#nat8bitcountleadingzero)  
[Function `bitcountTrailingZero`](#nat8bitcounttrailingzero)

### Wrapping Operations

[Function `addWrap`](#nat8addwrap)  
[Function `subWrap`](#nat8subwrap)  
[Function `mulWrap`](#nat8mulwrap)  
[Function `powWrap`](#nat8powwrap)

## minimumValue

```motoko
let minimumValue : Nat8 = 0
```

## maximumValue

```motoko
let maximumValue : Nat8 = 255
```

## Nat8.toNat

```motoko
func toNat(i : Nat8) : Nat
```

The function `toNat` takes one `Nat8` value and returns a `Nat` value.

```motoko, run
{{#include _mo/nat8/toNat.mo:a}}
```

## Nat8.toText

```motoko
func toText(i : Nat8) : Text
```

The function `toText` takes one `Nat8` value and returns a `Text` value.

```motoko, run
{{#include _mo/nat8/toText.mo:a}}
```

## Nat8.fromNat

```motoko
func fromNat(i : Nat) : Nat8
```

The function `fromNat` takes one `Nat` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/fromNat.mo:a}}
```

## Nat8.fromIntWrap

```motoko
func fromIntWrap(i : Int) : Nat8
```

The function `fromIntWrap` takes one `Int` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/fromIntWrap.mo:a}}
```

## Nat8.min

```motoko
func min(x : Nat8, y : Nat8) : Nat8
```

The function `min` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/min.mo:a}}
```

## Nat8.max

```motoko
func max(x : Nat8, y : Nat8) : Nat8
```

The function `max` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/max.mo:a}}
```

## Nat8.equal

```motoko
func equal(x : Nat8, y : Nat8) : Bool
```

The function `equal` takes two `Nat8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat8/equal.mo:a}}
```

## Nat8.notEqual

```motoko
func notEqual(x : Nat8, y : Nat8) : Bool
```

The function `notEqual` takes two `Nat8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat8/notEqual.mo:a}}
```

## Nat8.less

```motoko
func less(x : Nat8, y : Nat8) : Bool
```

The function `less` takes two `Nat8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat8/less.mo:a}}
```

## Nat8.lessOrEqual

```motoko
func lessOrEqual(x : Nat8, y : Nat8) : Bool
```

The function `lessOrEqual` takes two `Nat8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat8/lessOrEqual.mo:a}}
```

## Nat8.greater

```motoko
func greater(x : Nat8, y : Nat8) : Bool
```

The function `greater` takes two `Nat8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat8/greater.mo:a}}
```

## Nat8.greaterOrEqual

```motoko
func greaterOrEqual(x : Nat8, y : Nat8) : Bool
```

The function `greaterOrEqual` takes two `Nat8` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat8/greaterOrEqual.mo:a}}
```

## Nat8.compare

```motoko
func compare(x : Nat8, y : Nat8) : Bool
```

The function `compare` takes two `Nat8` value and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/nat8/compare.mo:a}}
```

## Nat8.add

```motoko
func add(x : Nat8, y : Nat8) : Nat8
```

The function `add` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/add.mo:a}}
```

## Nat8.sub

```motoko
func sub(x : Nat8, y : Nat8) : Nat8
```

The function `sub` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/sub.mo:a}}
```

## Nat8.mul

```motoko
func mul(x : Nat8, y : Nat8) : Nat8
```

The function `mul` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/mul.mo:a}}
```

## Nat8.div

```motoko
func div(x : Nat8, y : Nat8) : Nat8
```

The function `div` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/div.mo:a}}
```

## Nat8.rem

```motoko
func rem(x : Nat8, y : Nat8) : Nat8
```

The function `rem` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/rem.mo:a}}
```

## Nat8.pow

```motoko
func pow(x : Nat8, y : Nat8) : Nat8
```

The function `pow` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/pow.mo:a}}
```

## Nat8.bitnot

```motoko
func bitnot(x : Nat8) : Nat8
```

The function `bitnot` takes one `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitnot.mo:a}}
```

## Nat8.bitand

```motoko
func bitand(x : Nat8, y : Nat8) : Nat8
```

The function `bitand` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitand.mo:a}}
```

## Nat8.bitor

```motoko
func bitor(x : Nat8, y : Nat8) : Nat8
```

The function `bitor` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitor.mo:a}}
```

## Nat8.bitxor

```motoko
func bitxor(x : Nat8, y : Nat8) : Nat8
```

The function `bitxor` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitxor.mo:a}}
```

## Nat8.bitshiftLeft

```motoko
func bitshiftLeft(x : Nat8, y : Nat8) : Nat8
```

The function `bitshiftLeft` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitshiftLeft.mo:a}}
```

## Nat8.bitshiftRight

```motoko
func bitshiftRight(x : Nat8, y : Nat8) : Nat8
```

The function `bitshiftRight` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitshiftRight.mo:a}}
```

## Nat8.bitrotLeft

```motoko
func bitrotLeft(x : Nat8, y : Nat8) : Nat8
```

The function `bitrotLeft` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitrotLeft.mo:a}}
```

## Nat8.bitrotRight

```motoko
func bitrotRight(x : Nat8, y : Nat8) : Nat8
```

The function `bitrotRight` takes two `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitrotRight.mo:a}}
```

## Nat8.bittest

```motoko
func bittest(x : Nat8, p : Nat) : Bool
```

The function `bittest` takes one `Nat8` and one `Nat` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bittest.mo:a}}
```

## Nat8.bitset

```motoko
func bitset(x : Nat8, p : Nat) : Bool
```

The function `bitset` takes one `Nat8` and one `Nat` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitset.mo:a}}
```

## Nat8.bitclear

```motoko
func bitclear(x : Nat8, p : Nat) : Bool
```

The function `bitclear` takes one `Nat8` and one `Nat` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitclear.mo:a}}
```

## Nat8.bitflip

```motoko
func bitflip(x : Nat8, p : Nat) : Bool
```

The function `bitflip` takes one `Nat8` and one `Nat` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitflip.mo:a}}
```

## Nat8.bitcountNonZero

```motoko
let bitcountNonZero : (x : Nat8) -> Nat8
```

The function `bitcountNonZero` takes one `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitcountNonZero.mo:a}}
```

## Nat8.bitcountLeadingZero

```motoko
let bitcountLeadingZero : (x : Nat8) -> Nat8
```

The function `bitcountLeadingZero` takes one `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitcountLeadingZero.mo:a}}
```

## Nat8.bitcountTrailingZero

```motoko
let bitcountTrailingZero : (x : Nat8) -> Nat8
```

The function `bitcountTrailingZero` takes one `Nat8` value and returns a `Nat8` value.

```motoko, run
{{#include _mo/nat8/bitcountTrailingZero.mo:a}}
```

## Nat8.addWrap

```motoko
func addWrap(x : Nat8, y : Nat8) : Nat8
```

The function `addWrap` takes two `Nat8` value and returns a `Nat8` value.It is equivalent to the `+%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-addition-).

```motoko, run
{{#include _mo/nat8/addWrap.mo:a}}
```

## Nat8.subWrap

```motoko
func subWrap(x : Nat8, y : Nat8) : Nat8
```

The function `subWrap` takes two `Nat8` value and returns a `Nat8` value.It is equivalent to the `-%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-subtraction--).

```motoko, run
{{#include _mo/nat8/subWrap.mo:a}}
```

## Nat8.mulWrap

```motoko
func mulWrap(x : Nat8, y : Nat8) : Nat8
```

The function `mulWrap` takes two `Nat8` value and returns a `Nat8` value.It is equivalent to the `*%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-multiplication-).

```motoko, run
{{#include _mo/nat8/mulWrap.mo:a}}
```

## Nat8.powWrap

```motoko
func powWrap(x : Nat8, y : Nat8) : Nat8
```

The function `powWrap` takes two `Nat8` value and returns a `Nat8` value.It is equivalent to the `**%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-exponentiation-).

```motoko, run
{{#include _mo/nat8/powWrap.mo:a}}
```
