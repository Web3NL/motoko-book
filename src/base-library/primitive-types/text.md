# Text

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
import Text "mo:base/Text";
```

### Types

[Type `Pattern`](#type-textpattern)

### Analysis

[Function `size`](#textsize)  
[Function `contains`](#textcontains)  
[Function `startsWith`](#textstartswith)  
[Function `endsWith`](#textendswith)

### Conversion

[Function `fromChar`](#textfromchar)  
[Function `encodeUtf8`](#textencodeutf8)  
[Function `decodeUtf8`](#textdecodeutf8)

### Comparison

[Function `equal`](#textequal)    
[Function `notEqual`](#textnotequal)    
[Function `less`](#textless)    
[Function `lessOrEqual`](#textlessorequal)    
[Function `greater`](#textgreater)    
[Function `greaterOrEqual`](#textgreaterorequal)    
[Function `compare`](#textcompare)    

### Transformation

[Function `replace`](#textreplace)  
[Function `concat`](#textconcat)

## Type Pattern

The `Pattern` type is a useful [variant](common-programming-concepts/types/variants.html) _searching_ through `Text` values. If we traverse (visit each character of) a `Text`, we might look for a _text pattern_ that matches a `Pattern`.

This could be a _character_ in case of `#char : Char` or a _string_ in case of a `#text : Text`. We could also provide a function of type `Char -> Bool` that looks at each character and performs some logic to test whether some _predicate_ is true or false about that character.

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

The function `contains` takes one `Text` and one `Pattern` as arguments and returns a `Bool` value.

```motoko, run
{{#include _mo/text1.mo:a}}
```

## Text.startsWith

```motoko
func startsWith(t : Text, p : Pattern) : Bool
```

The function `startsWith` takes one `Text` and one `Pattern` as arguments and returns a `Bool` value.

```motoko, run
{{#include _mo/text2.mo:a}}
```

## Text.endsWith

```motoko
func endsWith(t : Text, p : Pattern) : Bool
```

The function `endsWith` takes one `Text` and one `Pattern` as arguments and returns a `Bool` value.

```motoko, run
{{#include _mo/text3.mo:a}}
```

## Text.fromChar

```motoko
func fromChar : (c : Char) -> Text
```

The function `fromChar` takes one `Text` argument and returns a `Char` value.

```motoko, run
{{#include _mo/text0.mo:a}}
```

## Text.encodeUtf8

```motoko
func encodeUtf8 : Text -> Blob
```

The function `encodeUtf8` takes one `Text` argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text6.mo:a}}
```

## Text.decodeUtf8

```motoko
func decodeUtf8 : Blob -> ?Text
```

The function `decodeUtf8` takes one `Blob` argument and returns a `?Text` value. If the blob is not valid UTF8, then this function returns `null`.

```motoko, run
{{#include _mo/text7.mo:a}}
```
## Text.equal

```motoko
func equal(t1 : Text, t2 : Text) : Bool
```

The function `equal` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text0.mo:a}}
```
## Text.notEqual

```motoko
func notEqual(t1 : Text, t2 : Text) : Bool
```

The function `notEqual` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text0.mo:a}}
```
## Text.less

```motoko
func less(t1 : Text, t2 : Text) : Bool
```

The function `less` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text0.mo:a}}
```
## Text.lessOrEqual

```motoko
func lessOrEqual(t1 : Text, t2 : Text) : Bool
```

The function `lessOrEqual` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text0.mo:a}}
```
## Text.greater

```motoko
func greater(t1 : Text, t2 : Text) : Bool
```

The function `greater` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text0.mo:a}}
```
## Text.greaterOrEqual

```motoko
func greaterOrEqual(t1 : Text, t2 : Text) : Bool
```

The function `greaterOrEqual` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text0.mo:a}}
```
## Text.compare

```motoko
func compare(t1 : Text, t2 : Text) : {#less; #equal; #greater}
```

The function `compare` takes two `Text` value as a argument and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/text0.mo:a}}
```

## Text.replace

```motoko
func replace(t : Text, p : Pattern, r : Text) : Text
```

The function `replace` takes one `Text`, one `Pattern` and one `Text` as arguments and returns a `Text` value.

```motoko, run
{{#include _mo/text4.mo:a}}
```

## Text.concat

```motoko
func concat(t1 : Text, t2 : Text) : Text
```

The function `concat` takes two `Text` arguments and returns a `Text` value. It is equivalent to the `#` [operator](/common-programming-concepts/operators/text-concatenation.html).

```motoko, run
{{#include _mo/text8.mo:a}}
```
