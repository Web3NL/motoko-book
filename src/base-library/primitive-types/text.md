# Text

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
import Text "mo:base/Text";
```

### Types

[Type `Pattern`](#type-pattern)

### Analysis

[Function `size`](#textsize)  
[Function `contains`](#textcontains)  
[Function `startsWith`](#textstartswith)  
[Function `endsWith`](#textendswith)  
[Function `stripStart`](#textstripstart)  
[Function `stripEnd`](#textstripend)  
[Function `trimStart`](#texttrimstart)  
[Function `trimEnd`](#texttrimend)  
[Function `trim`](#texttrim)

### Conversion

[Function `fromChar`](#textfromchar)  
[Function `toIter`](#texttoiter)  
[Function `fromIter`](#textfromiter)  
[Function `hash`](#texthash)  
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
[Function `join`](#textjoin)  
[Function `map`](#textmap)  
[Function `translate`](#texttranslate)  
[Function `split`](#textsplit)  
[Function `tokens`](#texttokens)  
[Function `compareWith`](#textcomparewith)

## Type Pattern

The `Pattern` type is a useful [variant](common-programming-concepts/types/variants.html) _searching_ through `Text` values. If we traverse (visit each character of) a `Text`, we might look for a _text pattern_ that matches a `Pattern`.

This could be a _character_ in case of `#char : Char` or a _string_ in case of a `#text : Text`. We could also provide a function of type `Char -> Bool` that looks at each character and performs some logic to test whether some _predicate_ is true or false about that character.

```motoko, run
{{#include _mo/text/text5.mo:a}}
```

## Text.size

```motoko
func size(t : Text) : Nat
```

The function `size` takes one `Text` value as a argument and returns a `Nat` value.

```motoko, run
{{#include _mo/text/text.mo:a}}
```

## Text.contains

```motoko
func contains(t : Text, p : Pattern) : Bool
```

```motoko, run
{{#include _mo/text/text1.mo:a}}
```

## Text.startsWith

```motoko
func startsWith(t : Text, p : Pattern) : Bool
```

```motoko, run
{{#include _mo/text/text2.mo:a}}
```

## Text.endsWith

```motoko
func endsWith(t : Text, p : Pattern) : Bool
```

```motoko, run
{{#include _mo/text/text3.mo:a}}
```

## Text.stripStart

```motoko
func stripStart(t : Text, p : Pattern) : ?Text
```

```motoko, run
{{#include _mo/text/text16.mo:a}}
```

## Text.stripEnd

```motoko
func stripEnd(t : Text, p : Pattern) : ?Text
```

```motoko, run
{{#include _mo/text/text17.mo:a}}
```

## Text.trimStart

```motoko
func trimStart(t : Text, p : Pattern) : Text
```

```motoko, run
{{#include _mo/text/text18.mo:a}}
```

## Text.trimEnd

```motoko
func trimEnd(t : Text, p : Pattern) : Text
```

```motoko, run
{{#include _mo/text/text19.mo:a}}
```

## Text.trim

```motoko
func trim(t : Text, p : Pattern) : Text
```

```motoko, run
{{#include _mo/text/text23.mo:a}}
```

## Text.fromChar

```motoko
func fromChar : (c : Char) -> Text
```

The function `fromChar` takes one `Text`value as a argument and returns a `Char` value.

```motoko, run
{{#include _mo/text/text0.mo:a}}
```

## Text.toIter

```motoko
func toIter(t : Text) : Iter.Iter<Char>
```

```motoko, run
{{#include _mo/text/text20.mo:a}}
```

## Text.fromIter

```motoko
func fromIter(cs : Iter.Iter<Char>) : Text
```

```motoko, run
{{#include _mo/text/text21.mo:a}}
```

## Text.hash

```motoko
func hash(t : Text) : Hash.Hash
```

The function `hash` takes one `Text` value as a argument and returns a `Hash` value.

```motoko, run
{{#include _mo/text/text22.mo:a}}
```

## Text.encodeUtf8

```motoko
func encodeUtf8 : Text -> Blob
```

The function `encodeUtf8` takes one `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text/text6.mo:a}}
```

## Text.decodeUtf8

```motoko
func decodeUtf8 : Blob -> ?Text
```

The function `decodeUtf8` takes one `Blob` value as a argument and returns a `?Text` value. If the blob is not valid UTF8, then this function returns `null`.

```motoko, run
{{#include _mo/text/text7.mo:a}}
```

## Text.equal

```motoko
func equal(t1 : Text, t2 : Text) : Bool
```

The function `equal` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text/text9.mo:a}}
```

## Text.notEqual

```motoko
func notEqual(t1 : Text, t2 : Text) : Bool
```

The function `notEqual` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text/text10.mo:a}}
```

## Text.less

```motoko
func less(t1 : Text, t2 : Text) : Bool
```

The function `less` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text/text11.mo:a}}
```

## Text.lessOrEqual

```motoko
func lessOrEqual(t1 : Text, t2 : Text) : Bool
```

The function `lessOrEqual` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text/text12.mo:a}}
```

## Text.greater

```motoko
func greater(t1 : Text, t2 : Text) : Bool
```

The function `greater` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text/text13.mo:a}}
```

## Text.greaterOrEqual

```motoko
func greaterOrEqual(t1 : Text, t2 : Text) : Bool
```

The function `greaterOrEqual` takes two `Text` value as a argument and returns a `Bool` value.

```motoko, run
{{#include _mo/text/text14.mo:a}}
```

## Text.compare

```motoko
func compare(t1 : Text, t2 : Text) : {#less; #equal; #greater}
```

The function `compare` takes two `Text` value as a argument and returns an [Order](/base-library/utils/order.html) value.

```motoko, run
{{#include _mo/text/text15.mo:a}}
```

## Text.replace

```motoko
func replace(t : Text, p : Pattern, r : Text) : Text
```

| **Parameters**     |                   |
| ------------------ | ----------------- |
| Variable argument1 | `t : Text`        |
| Variable argument2 | `r : Text`        |
| Object argument    | `p : pattern`     |
| Return type        | `Iter.Iter<Text>` |

```motoko, run
{{#include _mo/text/text4.mo:a}}
```

## Text.concat

```motoko
func concat(t1 : Text, t2 : Text) : Text
```

The function `concat` takes two `Text` value as a arguments and returns a `Text` value. It is equivalent to the `#` [operator](/common-programming-concepts/operators/text-concatenation.html).

```motoko, run
{{#include _mo/text/text8.mo:a}}
```

## Text.join

```motoko
func join(sep : Text, ts : Iter.Iter<Text>) : Text
```

| **Parameters**    |                        |
| ----------------- | ---------------------- |
| Variable argument | `sep : Text`           |
| Object argument   | `ts : Iter.Iter<Text>` |
| Return type       | `Text`                 |

```motoko, run
{{#include _mo/text/text24.mo:a}}
```

## Text.map

```motoko
func map(t : Text, f : Char -> Char) : Text
```

| **Parameters**    |                    |
| ----------------- | ------------------ |
| Variable argument | `t : Text`         |
| Function argument | `f : Char -> Char` |
| Return type       | `Text`             |

```motoko, run
{{#include _mo/text/text25.mo:a}}
```

## Text.translate

```motoko
func translate(t : Text, f : Char -> Text) : Text
```

| **Parameters**    |                    |
| ----------------- | ------------------ |
| Variable argument | `t : Text`         |
| Function argument | `f : Char -> Char` |
| Return type       | `Text`             |

```motoko, run
{{#include _mo/text/text26.mo:a}}
```

## Text.split

```motoko
func split(t : Text, p : Pattern) : Iter.Iter<Text>
```

| **Parameters**    |                   |
| ----------------- | ----------------- |
| Variable argument | `t : Text`        |
| Object argument   | `p : pattern`     |
| Return type       | `Iter.Iter<Text>` |

```motoko, run
{{#include _mo/text/text27.mo:a}}
```

## Text.tokens

```motoko
func tokens(t : Text, p : Pattern) : Iter.Iter<Text>
```

| **Parameters**    |                   |
| ----------------- | ----------------- |
| Variable argument | `t : Text`        |
| Object argument   | `p : pattern`     |
| Return type       | `Iter.Iter<Text>` |

```motoko, run
{{#include _mo/text/text28.mo:a}}
```

## Text.compareWith

```motoko
func compareWith(t1 : Text, t2 : Text, cmp : (Char, Char) -> {#less; #equal; #greater}) : {#less; #equal; #greater}
```

| **Parameters**     |                                                   |
| ------------------ | ------------------------------------------------- |
| Variable argument1 | `t1 : Text`                                       |
| Variable argument2 | `t2 : Text`                                       |
| Function argument  | `cmp : (Char, Char) -> {#less; #equal; #greater}` |
| Return type        | `{#less; #equal; #greater}`                       |

```motoko, run
{{#include _mo/text/text29.mo:a}}
```
