> **BETA WARNING** _This chapter is being reviewed and updated_

# Nat32

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/nat32/nat32.mo:a}}
```

### On this page

### Constants

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

### Conversion

[Function `toNat`](#nat32tonat)  
[Function `toText`](#nat32totext)  
[Function `fromNat`](#nat32fromnat)  
[Function `fromIntWrap`](#nat32fromintwrap)

### Comparison

[Function `min`](#nat32min)  
[Function `max`](#nat32max)  
[Function `equal`](#nat32equal)  
[Function `notEqual`](#nat32notequal)  
[Function `less`](#nat32less)  
[Function `lessOrEqual`](#nat32lessorequal)  
[Function `greater`](#nat32greater)  
[Function `greaterOrEqual`](#nat32greaterorequal)  
[Function `compare`](#nat32compare)

### Numerical Operations

[Function `add`](#nat32add)  
[Function `sub`](#nat32sub)  
[Function `mul`](#nat32mul)  
[Function `div`](#nat32div)  
[Function `rem`](#nat32rem)  
[Function `pow`](#nat32pow)

### Bitwise Operators

[Function `bitnot`](#nat32bitnot)  
[Function `bitand`](#nat32bitand)  
[Function `bitor`](#nat32bitor)  
[Function `bitxor`](#nat32bitxor)  
[Function `bitshiftLeft`](#nat32bitshiftleft)  
[Function `bitshiftRight`](#nat32bitshiftright)  
[Function `bitrotLeft`](#nat32bitrotleft)  
[Function `bitrotRight`](#nat32bitrotright)  
[Function `bittest`](#nat32bittest)  
[Function `bitset`](#nat32bitset)  
[Function `bitclear`](#nat32bitclear)  
[Function `bitflip`](#nat32bitflip)  
[Function `bitcountNonZero`](#nat32bitcountnonzero)  
[Function `bitcountLeadingZero`](#nat32bitcountleadingzero)  
[Function `bitcountTrailingZero`](#nat32bitcounttrailingzero)

### Wrapping Operations

[Function `addWrap`](#nat32addwrap)  
[Function `subWrap`](#nat32subwrap)  
[Function `mulWrap`](#nat32mulwrap)  
[Function `powWrap`](#nat32powwrap)

## minimumValue

```motoko
let minimumValue : Nat32 = 0;
```

## maximumValue

```motoko
let maximumValue : Nat32 = 4_294_967_295;
```

## Nat32.toNat

```motoko
 func toNat(i : Nat32) : Nat
```

The function `toNat` takes one `Nat32` value and returns a `Nat` value.

```motoko, run
{{#include _mo/nat32/toNat.mo:a}}
```

## Nat32.toText

```motoko
 func toText(i : Nat32) : Text
```

The function `toText` takes one `Nat32` value and returns a `Text` value.

```motoko, run
{{#include _mo/nat32/toText.mo:a}}
```

## Nat32.fromNat

```motoko
 func fromNat(i : Nat) : Nat32
```

The function `fromNat` takes one `Nat` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/fromNat.mo:a}}
```

## Nat32.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Nat32
```

The function `fromIntWrap` takes one `Int` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/fromIntWrap.mo:a}}
```

## Nat32.min

```motoko
func min(x : Nat32, y : Nat32) : Nat32
```

The function `min` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/min.mo:a}}
```

## Nat32.max

```motoko
func max(x : Nat32, y : Nat32) : Nat32
```

The function `max` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/max.mo:a}}
```

## Nat32.equal

```motoko
func equal(x : Nat32, y : Nat32) : Bool
```

The function `equal` takes two `Nat32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat32/equal.mo:a}}
```

## Nat32.notEqual

```motoko
func notEqual(x : Nat32, y : Nat32) : Bool
```

The function `notEqual` takes two `Nat32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat32/notEqual.mo:a}}
```

## Nat32.less

```motoko
func less(x : Nat32, y : Nat32) : Bool
```

The function `less` takes two `Nat32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat32/less.mo:a}}
```

## Nat32.lessOrEqual

```motoko
func lessOrEqual(x : Nat32, y : Nat32) : Bool
```

The function `lessOrEqual` takes two `Nat32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat32/lessOrEqual.mo:a}}
```

## Nat32.greater

```motoko
func greater(x : Nat32, y : Nat32) : Bool
```

The function `greater` takes two `Nat32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat32/greater.mo:a}}
```

## Nat32.greaterOrEqual

```motoko
func greaterOrEqual(x : Nat32, y : Nat32) : Bool
```

The function `greaterOrEqual` takes two `Nat32` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat32/greaterOrEqual.mo:a}}
```

## Nat32.compare

```motoko
func compare(x : Nat32, y : Nat32) : Bool
```

The function `compare` takes two `Nat32` value and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/nat32/compare.mo:a}}
```

## Nat32.add

```motoko
func add(x : Nat32, y : Nat32) : Nat32
```

The function `add` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/add.mo:a}}
```

## Nat32.sub

```motoko
func sub(x : Nat32, y : Nat32) : Nat32
```

The function `sub` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/sub.mo:a}}
```

## Nat32.mul

```motoko
func mul(x : Nat32, y : Nat32) : Nat32
```

The function `mul` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/mul.mo:a}}
```

## Nat32.div

```motoko
func div(x : Nat32, y : Nat32) : Nat32
```

The function `div` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/div.mo:a}}
```

## Nat32.rem

```motoko
func rem(x : Nat32, y : Nat32) : Nat32
```

The function `rem` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/rem.mo:a}}
```

## Nat32.pow

```motoko
func pow(x : Nat32, y : Nat32) : Nat32
```

The function `pow` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/pow.mo:a}}
```

## Nat32.bitnot

```motoko
func bitnot(x : Nat32) : Nat32
```

The function `bitnot` takes one `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitnot.mo:a}}
```

## Nat32.bitand

```motoko
func bitand(x : Nat32, y : Nat32) : Nat32
```

The function `bitand` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitand.mo:a}}
```

## Nat32.bitor

```motoko
func bitor(x : Nat32, y : Nat32) : Nat32
```

The function `bitor` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitor.mo:a}}
```

## Nat32.bitxor

```motoko
func bitxor(x : Nat32, y : Nat32) : Nat32
```

The function `bitxor` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitxor.mo:a}}
```

## Nat32.bitshiftLeft

```motoko
func bitshiftLeft(x : Nat32, y : Nat32) : Nat32
```

The function `bitshiftLeft` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitshiftLeft.mo:a}}
```

## Nat32.bitshiftRight

```motoko
func bitshiftRight(x : Nat32, y : Nat32) : Nat32
```

The function `bitshiftRight` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitshiftRight.mo:a}}
```

## Nat32.bitrotLeft

```motoko
func bitrotLeft(x : Nat32, y : Nat32) : Nat32
```

The function `bitrotLeft` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitrotLeft.mo:a}}
```

## Nat32.bitrotRight

```motoko
func bitrotRight(x : Nat32, y : Nat32) : Nat32
```

The function `bitrotRight` takes two `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitrotRight.mo:a}}
```

## Nat32.bittest

```motoko
func bittest(x : Nat32, p : Nat) : Bool
```

The function `bittest` takes one `Nat32` and one `Nat` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bittest.mo:a}}
```

## Nat32.bitset

```motoko
func bitset(x : Nat32, p : Nat) : Bool
```

The function `bitset` takes one `Nat32` and one `Nat` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitset.mo:a}}
```

## Nat32.bitclear

```motoko
func bitclear(x : Nat32, p : Nat) : Bool
```

The function `bitclear` takes one `Nat32` and one `Nat` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitclear.mo:a}}
```

## Nat32.bitflip

```motoko
func bitflip(x : Nat32, p : Nat) : Bool
```

The function `bitflip` takes one `Nat32` and one `Nat` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitflip.mo:a}}
```

## Nat32.bitcountNonZero

```motoko
let bitcountNonZero : (x : Nat32) -> Nat32
```

The function `bitcountNonZero` takes one `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitcountNonZero.mo:a}}
```

## Nat32.bitcountLeadingZero

```motoko
let bitcountLeadingZero : (x : Nat32) -> Nat32
```

The function `bitcountLeadingZero` takes one `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitcountLeadingZero.mo:a}}
```

## Nat32.bitcountTrailingZero

```motoko
let bitcountTrailingZero : (x : Nat32) -> Nat32
```

The function `bitcountTrailingZero` takes one `Nat32` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/nat32/bitcountTrailingZero.mo:a}}
```

## Nat32.addWrap

```motoko
func addWrap(x : Nat32, y : Nat32) : Nat32
```

The function `addWrap` takes two `Nat32` value and returns a `Nat32` value.It is equivalent to the `+%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-addition-).

```motoko, run
{{#include _mo/nat32/addWrap.mo:a}}
```

## Nat32.subWrap

```motoko
func subWrap(x : Nat32, y : Nat32) : Nat32
```

The function `subWrap` takes two `Nat32` value and returns a `Nat32` value.It is equivalent to the `-%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-subtraction--).

```motoko, run
{{#include _mo/nat32/subWrap.mo:a}}
```

## Nat32.mulWrap

```motoko
func mulWrap(x : Nat32, y : Nat32) : Nat32
```

The function `mulWrap` takes two `Nat32` value and returns a `Nat32` value.It is equivalent to the `*%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-multiplication-).

```motoko, run
{{#include _mo/nat32/mulWrap.mo:a}}
```

## Nat32.powWrap

```motoko
func powWrap(x : Nat32, y : Nat32) : Nat32
```

The function `powWrap` takes two `Nat32` value and returns a `Nat32` value.It is equivalent to the `**%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-exponentiation-).

```motoko, run
{{#include _mo/nat32/powWrap.mo:a}}
```
