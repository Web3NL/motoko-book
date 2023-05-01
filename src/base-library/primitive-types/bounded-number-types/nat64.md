> **BETA WARNING** _This chapter is being reviewed and updated_

# Nat64

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/nat64/nat64.mo:a}}
```

### On this page

### Constants

[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)

### Conversion

[Function `toNat`](#nat64tonat)  
[Function `toText`](#nat64totext)  
[Function `fromNat`](#nat64fromnat)  
[Function `fromIntWrap`](#nat64fromintwrap)

### Comparison

[Function `min`](#nat64min)  
[Function `max`](#nat64max)  
[Function `equal`](#nat64equal)  
[Function `notEqual`](#nat64notequal)  
[Function `less`](#nat64less)  
[Function `lessOrEqual`](#nat64lessorequal)  
[Function `greater`](#nat64greater)  
[Function `greaterOrEqual`](#nat64greaterorequal)  
[Function `compare`](#nat64compare)

### Numerical Operations

[Function `add`](#nat64add)  
[Function `sub`](#nat64sub)  
[Function `mul`](#nat64mul)  
[Function `div`](#nat64div)  
[Function `rem`](#nat64rem)  
[Function `pow`](#nat64pow)

### Bitwise Operators

[Function `bitnot`](#nat64bitnot)  
[Function `bitand`](#nat64bitand)  
[Function `bitor`](#nat364itor)  
[Function `bitxor`](#nat64bitxor)  
[Function `bitshiftLeft`](#nat64bitshiftleft)  
[Function `bitshiftRight`](#nat64bitshiftright)  
[Function `bitrotLeft`](#nat64bitrotleft)  
[Function `bitrotRight`](#nat64bitrotright)  
[Function `bittest`](#nat64bittest)  
[Function `bitset`](#nat64bitset)  
[Function `bitclear`](#nat64bitclear)  
[Function `bitflip`](#nat64bitflip)  
[Function `bitcountNonZero`](#nat64bitcountnonzero)  
[Function `bitcountLeadingZero`](#nat64bitcountleadingzero)  
[Function `bitcountTrailingZero`](#nat64bitcounttrailingzero)

### Wrapping Operations

[Function `addWrap`](#nat64addwrap)  
[Function `subWrap`](#nat64subwrap)  
[Function `mulWrap`](#nat64mulwrap)  
[Function `powWrap`](#nat64powwrap)

## minimumValue

```motoko
let minimumValue : Nat64 = 0;
```

## maximumValue

```motoko
let maximumValue : Nat64 = 18_446_744_073_709_551_615;
```

## Nat64.toNat

```motoko
 func toNat(i : Nat64) : Nat
```

The function `toNat` takes one `Nat64` value and returns an `Nat` value.

```motoko, run
{{#include _mo/nat64/toNat.mo:a}}
```

## Nat64.toText

```motoko
 func toText(i : Nat64) : Text
```

The function `toText` takes one `Nat64` value and returns a `Text` value.

```motoko, run
{{#include _mo/nat64/toText.mo:a}}
```

## Nat64.fromNat

```motoko
 func fromNat(i : Nat) : Nat64
```

The function `fromNat` takes one `Nat` value and returns an `Nat64` value.

```motoko, run
{{#include _mo/nat64/fromNat.mo:a}}
```

## Nat64.fromIntWrap

```motoko
 func fromIntWrap(i : Int) : Nat64
```

The function `fromIntWrap` takes one `Int` value and returns an `Nat64` value.

```motoko, run
{{#include _mo/nat64/fromIntWrap.mo:a}}
```

## Nat64.min

```motoko
func min(x : Nat64, y : Nat64) : Nat64
```

The function `min` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/min.mo:a}}
```

## Nat64.max

```motoko
func max(x : Nat64, y : Nat64) : Nat64
```

The function `max` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/max.mo:a}}
```

## Nat64.equal

```motoko
func equal(x : Nat64, y : Nat64) : Bool
```

The function `equal` takes two `Nat64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat64/equal.mo:a}}
```

## Nat64.notEqual

```motoko
func notEqual(x : Nat64, y : Nat64) : Bool
```

The function `notEqual` takes two `Nat64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat64/notEqual.mo:a}}
```

## Nat64.less

```motoko
func less(x : Nat64, y : Nat64) : Bool
```

The function `less` takes two `Nat64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat64/less.mo:a}}
```

## Nat64.lessOrEqual

```motoko
func lessOrEqual(x : Nat64, y : Nat64) : Bool
```

The function `lessOrEqual` takes two `Nat64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat64/lessOrEqual.mo:a}}
```

## Nat64.greater

```motoko
func greater(x : Nat64, y : Nat64) : Bool
```

The function `greater` takes two `Nat64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat64/greater.mo:a}}
```

## Nat64.greaterOrEqual

```motoko
func greaterOrEqual(x : Nat64, y : Nat64) : Bool
```

The function `greaterOrEqual` takes two `Nat64` value and returns a `Bool` value.

```motoko, run
{{#include _mo/nat64/greaterOrEqual.mo:a}}
```

## Nat64.compare

```motoko
func compare(x : Nat64, y : Nat64) : Bool
```

The function `compare` takes two `Nat64` value and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/nat64/compare.mo:a}}
```

## Nat64.add

```motoko
func add(x : Nat64, y : Nat64) : Nat64
```

The function `add` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/add.mo:a}}
```

## Nat64.sub

```motoko
func sub(x : Nat64, y : Nat64) : Nat64
```

The function `sub` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/sub.mo:a}}
```

## Nat64.mul

```motoko
func mul(x : Nat64, y : Nat64) : Nat64
```

The function `mul` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/mul.mo:a}}
```

## Nat64.div

```motoko
func div(x : Nat64, y : Nat64) : Nat64
```

The function `div` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/div.mo:a}}
```

## Nat64.rem

```motoko
func rem(x : Nat64, y : Nat64) : Nat64
```

The function `rem` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/rem.mo:a}}
```

## Nat64.pow

```motoko
func pow(x : Nat64, y : Nat64) : Nat64
```

The function `pow` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/pow.mo:a}}
```

## Nat64.bitnot

```motoko
func bitnot(x : Nat64) : Nat64
```

The function `bitnot` takes one `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitnot.mo:a}}
```

## Nat64.bitand

```motoko
func bitand(x : Nat64, y : Nat64) : Nat64
```

The function `bitand` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitand.mo:a}}
```

## Nat64.bitor

```motoko
func bitor(x : Nat64, y : Nat64) : Nat64
```

The function `bitor` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitor.mo:a}}
```

## Nat64.bitxor

```motoko
func bitxor(x : Nat64, y : Nat64) : Nat64
```

The function `bitxor` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitxor.mo:a}}
```

## Nat64.bitshiftLeft

```motoko
func bitshiftLeft(x : Nat64, y : Nat64) : Nat64
```

The function `bitshiftLeft` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitshiftLeft.mo:a}}
```

## Nat64.bitshiftRight

```motoko
func bitshiftRight(x : Nat64, y : Nat64) : Nat64
```

The function `bitshiftRight` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitshiftRight.mo:a}}
```

## Nat64.bitrotLeft

```motoko
func bitrotLeft(x : Nat64, y : Nat64) : Nat64
```

The function `bitrotLeft` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitrotLeft.mo:a}}
```

## Nat64.bitrotRight

```motoko
func bitrotRight(x : Nat64, y : Nat64) : Nat64
```

The function `bitrotRight` takes two `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitrotRight.mo:a}}
```

## Nat64.bittest

```motoko
func bittest(x : Nat64, p : Nat) : Bool
```

The function `bittest` takes one `Nat64` and one `Nat` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bittest.mo:a}}
```

## Nat64.bitset

```motoko
func bitset(x : Nat64, p : Nat) : Bool
```

The function `bitset` takes one `Nat64` and one `Nat` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitset.mo:a}}
```

## Nat64.bitclear

```motoko
func bitclear(x : Nat64, p : Nat) : Bool
```

The function `bitclear` takes one `Nat64` and one `Nat` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitclear.mo:a}}
```

## Nat64.bitflip

```motoko
func bitflip(x : Nat64, p : Nat) : Bool
```

The function `bitflip` takes one `Nat64` and one `Nat` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitflip.mo:a}}
```

## Nat64.bitcountNonZero

```motoko
let bitcountNonZero : (x : Nat64) -> Nat64
```

The function `bitcountNonZero` takes one `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitcountNonZero.mo:a}}
```

## Nat64.bitcountLeadingZero

```motoko
let bitcountLeadingZero : (x : Nat64) -> Nat64
```

The function `bitcountLeadingZero` takes one `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitcountLeadingZero.mo:a}}
```

## Nat64.bitcountTrailingZero

```motoko
let bitcountTrailingZero : (x : Nat64) -> Nat64
```

The function `bitcountTrailingZero` takes one `Nat64` value and returns a `Nat64` value.

```motoko, run
{{#include _mo/nat64/bitcountTrailingZero.mo:a}}
```

## Nat64.addWrap

```motoko
func addWrap(x : Nat64, y : Nat64) : Nat64
```

The function `addWrap` takes two `Nat64` value and returns a `Nat64` value.It is equivalent to the `+%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-addition-).

```motoko, run
{{#include _mo/nat64/addWrap.mo:a}}
```

## Nat64.subWrap

```motoko
func subWrap(x : Nat64, y : Nat64) : Nat64
```

The function `subWrap` takes two `Nat64` value and returns a `Nat64` value.It is equivalent to the `-%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-subtraction--).

```motoko, run
{{#include _mo/nat64/subWrap.mo:a}}
```

## Nat64.mulWrap

```motoko
func mulWrap(x : Nat64, y : Nat64) : Nat64
```

The function `mulWrap` takes two `Nat64` value and returns a `Nat64` value.It is equivalent to the `*%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-multiplication-).

```motoko, run
{{#include _mo/nat64/mulWrap.mo:a}}
```

## Nat64.powWrap

```motoko
func powWrap(x : Nat64, y : Nat64) : Nat64
```

The function `powWrap` takes two `Nat64` value and returns a `Nat64` value.It is equivalent to the `**%` [Bitwise operators](/common-programming-concepts/operators/bitwise-operators.html#wrapping-exponentiation-).

```motoko, run
{{#include _mo/nat64/powWrap.mo:a}}
```
