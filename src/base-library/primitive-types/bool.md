# Bool
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/bool.mo:a}}
```

## Bool.toText
The function `toText` takes one `Bool` argument and returns a `Text` value.  

```motoko
{{#include _mo/bool.mo:b}}
```

## Bool.compare
The function `compare` takes two `Bool` arguments and returns an `Order` variant value.  

```motoko
{{#include _mo/bool.mo:c}}
```
