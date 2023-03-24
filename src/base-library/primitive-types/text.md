# Text

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
import Text "mo:base/Text";
```

### Types

[Type `Pattern`]()  

### Analysis

[Function `size`](#textsize)  
[Function `contains`](#textcontains)  
[Function `startsWith`](#textstartswith)  
[Function `endsWith`](#textendswith)

### Conversion

[Function `fromChar`](#textfromchar)  
[Function `encodeUtf8`](#textencodeutf8)  
[Function `decodeUtf8`](#textdecodeutf8)

### Transformation

[Function `replace`](#textreplace)  
[Function `concat`](#textconcat)

## Text.Pattern
```motoko, run
{{#include _mo/text5.mo:a}}
```

## Text.size

```motoko
func size(t : Text) : Nat
```

The function `size` takes one `Text` argument and returns a `Nat` value.

```motoko, run
{{#include _mo/text.mo:a}}
```

## Text.contains

```motoko
func contains(t : Text, p : Pattern) : Bool
```

The function `contains` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value.

```motoko, run
{{#include _mo/text1.mo:a}}
```

## Text.startsWith

```motoko
func startsWith(t : Text, p : Pattern) : Bool
```

The function `startsWith` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value.

```motoko, run
{{#include _mo/text2.mo:a}}
```

## Text.endsWith

```motoko
func endsWith(t : Text, p : Pattern) : Bool
```

The function `endsWith` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value.

```motoko, run
{{#include _mo/text3.mo:a}}
```

## Text.fromChar

```motoko
let fromChar : (c : Char) -> Text
```

The function `fromChar` takes one `Text` argument and returns a `Char` value.

```motoko, run
{{#include _mo/text0.mo:a}}
```

## Text.encodeUtf8

```motoko
let encodeUtf8 : Text -> Blob
```

The function `encodeUtf8` takes one `Text` argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text6.mo:a}}
```

## Text.decodeUtf8

```motoko
let decodeUtf8 : Blob -> ?Text
```

The function `decodeUtf8` takes one `Blob` argument and returns a `?Text` value.

```motoko, run
{{#include _mo/text7.mo:a}}
```

## Text.replace

```motoko
func replace(t : Text, p : Pattern, r : Text) : Text
```

The function `replace` takes one `Text`,one `Pattern`and one `Text` as arguments and returns a `Text` value.

```motoko, run
{{#include _mo/text4.mo:a}}
```

## Text.concat

```motoko
func concat(t1 : Text, t2 : Text) : Text
```

The function `concat` takes two `Text` arguments and returns a `Text` value. It is equivalent to the `#` [operator](/common-programming-concepts/operators.html).

```motoko, run
{{#include _mo/text8.mo:a}}
```
