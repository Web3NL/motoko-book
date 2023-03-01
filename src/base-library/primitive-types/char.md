# Char
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/char.mo:a}}
```

## Public items
The following types and functions are made public in the `Char` module:  
[Type Char](#type)  
[Function `isDigit`](#charisdigit)    
[Function `toNat32`](#chartonat32)  
[Function `fromNat32`](#charfromnat32)  
[Function `isAlphabetic`](#charisalphabetic)  

## Type
```motoko
type Char = Char.Char
```


## Char.isDigit
The function `isDigit` takes one `Char` argument and returns a `Bool` value. 

```motoko
{{#include _mo/char.mo:b}}
```

## Char.toNat32
The function `toNat32` takes one `Char` argument and returns a `Nat32` value. 

```motoko
{{#include _mo/char.mo:c}}
```

## Char.fromNat32
The function `fromNat32` takes one `Nat32` argument and returns a `Char` value. 

```motoko
{{#include _mo/char.mo:d}}
```

## Char.isAlphabetic
The function `isAlphabetic` takes one `Char` argument and returns a `Bool` value. 

```motoko
{{#include _mo/char.mo:e}}
```

<!-- Type Char
Value toNat32
Value fromNat32
Value toText
Function isDigit
Value isAlphabetic -->