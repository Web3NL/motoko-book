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

## Bool.lognot
The function `lognot` takes one `Bool` arguments and returns an opposite `Bool` value.  

```motoko
{{#include _mo/bool.mo:d}}
```

## Bool.logand
The function `logand` takes two `Bool` arguments and returns an `Bool` value.

```motoko
{{#include _mo/bool1.mo:a}}
```

## Bool.logor
The function `logor` takes two `Bool` arguments and returns an `Bool` value.

```motoko
{{#include _mo/boo2.mo:a}}
```

## Bool.logxor
The function `logxor` takes two `Bool` arguments and returns an `Bool` value.

```motoko
{{#include _mo/bool3.mo:a}}
```

## Bool.notEqual
The function `notEqual` takes two `Bool` arguments and returns an `Bool` value.

```motoko
{{#include _mo/bool4.mo:a}}
```

## Bool.equal
The function `equal` takes two `Bool` arguments and returns an `Order` variant value.  

```motoko
{{#include _mo/boo5.mo:a}}

```
