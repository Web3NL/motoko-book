# Char
In Motoko, a *character literal* is a single character enclosed in **single quotes** and has type `Char`. (As opposed to a *text literals* of type `Text`, which may be multiple characters enclosed in **double quotes**.)

```motoko, run
let char : Char = 'a';

let text : Text = "a";
```

The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/char.mo:a}}
```

### Conversion  
[Function `isDigit`](#charisdigit)    
[Function `toNat32`](#chartonat32)  
[Function `fromNat32`](#charfromnat32)  
[Function `isAlphabetic`](#charisalphabetic)  


## Char.isDigit

```motoko
func isDigit(c : Char) : Bool
```

The function `isDigit` takes one `Char` argument and returns a `Bool` value. 

```motoko, run
{{#include _mo/char1.mo:a}}
```

## Char.toNat32

```motoko
func toNat32 : (c : Char) -> Nat32
```

The function `toNat32` takes one `Char` argument and returns a `Nat32` value. 

```motoko, run
{{#include _mo/char2.mo:a}}
```

## Char.fromNat32

```motoko
func fromNat32 : (w : Nat32) -> Char
```

The function `fromNat32` takes one `Nat32` argument and returns a `Char` value. 

```motoko, run
{{#include _mo/char3.mo:a}}
```

## Char.isAlphabetic

```motoko
func isAlphabetic : (c : Char) -> Bool
```

The function `isAlphabetic` takes one `Char` argument and returns a `Bool` value. 

```motoko, run
{{#include _mo/char4.mo:a}}
```
