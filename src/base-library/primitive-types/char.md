> **BETA WARNING** _This chapter is being reviewed and updated_

# Char

In Motoko, a _character literal_ is a single character enclosed in **single quotes** and has type `Char`. (As opposed to _text literals_ of type `Text`, which may be multiple characters enclosed in **double quotes**.)

```motoko, run
let char : Char = 'a';

let text : Text = "a";
```

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/char/char.mo:a}}
```

### Conversion

[Function `toNat32`](#chartonat32)  
[Function `fromNat32`](#charfromnat32)  
[Function `toText`](#chartotext)    

### Utility Function

[Function `isDigit`](#charisdigit)  
[Function `isWhitespace`](#chariswhitespace)  
[Function `isLowercase`](#charislowercase)  
[Function `isUppercase`](#charisuppercase)  
[Function `isAlphabetic`](#charisalphabetic)

### Comparison

[Function `equal`](#charequal)  
[Function `notEqual`](#charnotequal)  
[Function `less`](#charless)  
[Function `lessOrEqual`](#charlessorequal)  
[Function `greater`](#chargreater)  
[Function `greaterOrEqual`](#chargreaterorequal)  
[Function `compare`](#charcompare)  

## Char.toNat32

```motoko
func toNat32 : (c : Char) -> Nat32
```

The function `toNat32` takes one `Char` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/char/char2.mo:a}}
```

## Char.fromNat32

```motoko
func fromNat32 : (w : Nat32) -> Char
```

The function `fromNat32` takes one `Nat32` value and returns a `Char` value.

```motoko, run
{{#include _mo/char/char3.mo:a}}
```
## Char.toText

```motoko
func toText : (c : Char) -> Text
```

The function `toText` takes one `Char` value and returns a `Text` value.

```motoko, run
{{#include _mo/char/char12.mo:a}}
```

## Char.isDigit

```motoko
func isDigit(c : Char) : Bool
```

The function `isDigit` takes one `Char` value and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char1.mo:a}}
```

## Char.isWhitespace

```motoko
let isWhitespace : (c : Char) -> Bool
```

The function `isWhitespace` takes one `Char` value and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char13.mo:a}}
```
## Char.isLowercase

```motoko
func isLowercase(c : Char) : Bool
```

The function `isLowercase` takes one `Char` value and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char14.mo:a}}
```
## Char.isUppercase

```motoko
func isUppercase(c : Char) : Bool
```

The function `isUppercase` takes one `Char` value and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char15.mo:a}}
```

## Char.isAlphabetic

```motoko
func isAlphabetic : (c : Char) -> Bool
```

The function `isAlphabetic` takes one `Char` value and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char4.mo:a}}
```

## Char.equal

```motoko
func equal(x : Char, y : Char) : Bool
```

The function `equal` takes two `Char` value  and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char5.mo:a}}
```
## Char.notEqual

```motoko
func notEqual(x : Char, y : Char) : Bool
```

The function `notEqual` takes two `Char` value  and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char6.mo:a}}
```
## Char.less

```motoko
func less(x : Char, y : Char) : Bool
```

The function `less` takes two `Char` value  and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char7.mo:a}}
```
## Char.lessOrEqual

```motoko
func lessOrEqual(x : Char, y : Char) : Bool
```

The function `lessOrEqual` takes two `Char` value  and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char8.mo:a}}
```
## Char.greater

```motoko
func greater(x : Char, y : Char) : Bool
```

The function `greater` takes two `Char` value  and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char9.mo:a}}
```
## Char.greaterOrEqual

```motoko
func greaterOrEqual(x : Char, y : Char) : Bool
```

The function `greaterOrEqual` takes two `Char` value  and returns a `Bool` value.

```motoko, run
{{#include _mo/char/char10.mo:a}}
```
## Char.compare

```motoko
func compare(x : Char, y : Char) : {#less; #equal; #greater}
```

The function `compare` takes two `Char` value  and returns an [Order](/base-library/utils/order.html) value.

```motoko, run
{{#include _mo/char/char11.mo:a}}
```
