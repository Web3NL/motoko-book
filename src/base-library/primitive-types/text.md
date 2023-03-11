
# Text
The convention is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/text.mo:a}}
```

## Public items
The following types and functions are made public in the `Text` module:  
[Type Text](#type)  
[Function `size`](#textsize)    
[Function `fromChar`](#textfromchar)  
[Function `contains`](#textcontains)  
[Function `startsWith`](#textstartswith)  
[Function `endsWith`](#textendswith)  
[Function `replace`](#textreplace)  
[Function `concat`](#textconcat)  


## Type
```motoko
type Text = Text.Text
```


## Text.size

```motoko
func size(t : Text) : Nat
```

The function `size` takes one `Text` argument and returns a `Nat` value. 

```motoko
{{#include _mo/text.mo:c}}
```

## Text.fromChar

```motoko
let fromChar : (c : Char) -> Text
```

The function `fromChar` takes one `Text` argument and returns a `Char` value. 

```motoko
{{#include _mo/text.mo:d}}
```

## Text.contains

```motoko
func contains(t : Text, p : Pattern) : Bool
```

The function `contains` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value. 

```motoko
{{#include _mo/text1.mo:a}}
```

## Text.startsWith

```motoko
func startsWith(t : Text, p : Pattern) : Bool
```

The function `startsWith` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value. 

```motoko
{{#include _mo/text2.mo:a}}
```

## Text.endsWith

```motoko
func endsWith(t : Text, p : Pattern) : Bool
```

The function `endsWith` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value. 

```motoko
{{#include _mo/text3.mo:a}}
```

## Text.replace

```motoko
func replace(t : Text, p : Pattern, r : Text) : Text
```

The function `replace` takes one `Text`,one `Pattern`and one `Text` as arguments and returns a `Text` value. 

```motoko
{{#include _mo/text4.mo:a}}
```
## Text.concat

```motoko
func concat(t1 : Text, t2 : Text) : Text
```

The function `concat` takes two `Text` arguments and returns a `Text` value. It is equivalent to the `#` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/text4.mo:b}}
```


<!-- Type Text
Value fromChar
Function size
Function contains
Function startsWith
Function endsWith
Function replace
Value encodeUtf8
Value decodeUtf8 -->