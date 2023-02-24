
# Text
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/text.mo:a}}
```

## Text.size
The function `size` takes one `Text` argument and returns a `Nat` value. 

```motoko
{{#include _mo/text.mo:c}}
```

## Text.fromChar
The function `fromChar` takes one `Text` argument and returns a `Char` value. 

```motoko
{{#include _mo/text.mo:d}}
```

## Text.contains
The function `contains` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value. 

```motoko
{{#include _mo/text1.mo:a}}
```

## Text.startsWith
The function `startsWith` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value. 

```motoko
{{#include _mo/text2.mo:a}}
```

## Text.endsWith
The function `endsWith` takes one `Text`,one `Pattern` as arguments and returns a `Bool` value. 

```motoko
{{#include _mo/text3.mo:a}}
```

## Text.replace
The function `replace` takes one `Text`,one `Pattern`and one `Text` as arguments and returns a `Text` value. 

```motoko
{{#include _mo/text4.mo:a}}
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