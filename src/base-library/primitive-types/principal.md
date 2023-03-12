# Principal
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/principal.mo:a}}
```

## Public items
The following types and functions are made public in the `Principal` module:  
[Type Principal](#type)  
[Function `fromActor`](#principalfromactor)    
[Function `toText`](#principaltotext)  
[Function `fromText`](#principalfromtext)  
[Function `toBlob`](#principaltoblob)  
[Function `fromBlob`](#principalfromblob)  
[Function `isAnonymous`](#principalisanonymous)  


## Type
```motoko
type Principal = Principal.Principal
```

## Principal.fromActor

```motoko
func fromActor(a : actor {  }) : Principal
```

The function `fromActor` takes one `Actor` argument and returns a `Principal` value. 

```motoko
{{#include _mo/principal.mo:b}}
```

## Principal.toText

```motoko
func toText(p : Principal) : Text
```

The function `toText` takes one `Principal` argument and returns a `textualPrincipal` value. 

```motoko
{{#include _mo/principal.mo:c}}
```

## Principal.fromText

```motoko
func fromText(t : Text) : Principal
```

The function `fromText` takes one `textualPrincipal` argument and returns a `Principal` value. 

```motoko
{{#include _mo/principal.mo:d}}
```

## Principal.toBlob

```motoko
func toBlob(p : Principal) : Blob
```

The function `toBlob` takes one `Principal` argument and returns a `Blob` value. 

```motoko
{{#include _mo/principal.mo:e}}
```

## Principal.fromBlob

```motoko
func fromBlob(b : Blob) : Principal
```

The function `fromBlob` takes one `BLob` argument and returns a `Principal` value. 

```motoko
{{#include _mo/principal.mo:f}}
```

## Principal.isAnonymous

```motoko
func isAnonymous(p : Principal) : Bool
```

The function `isAnonymous` takes one `Principal` argument and returns a `Bool` value. 

```motoko
{{#include _mo/principal.mo:g}}
```

<!-- - type Principal

- fromActor
- toBlob
- fromBlob
- toText
- isAnonymous
- fromText -->