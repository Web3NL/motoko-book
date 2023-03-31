# Principal
To understand this *principal module*, it might be helpful to learn about [Principles](/internet-computer-programming-concepts/principals-and-authentication.html) first.  

The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:
```motoko
{{#include _mo/principal.mo:a}}
```

### Conversion
[Function `fromActor`](#principalfromactor)    
[Function `fromText`](#principalfromtext)  
[Function `toText`](#principaltotext)   
[Function `toBlob`](#principaltoblob)  
[Function `fromBlob`](#principalfromblob)  

### Utility
[Function `isAnonymous`](#principalisanonymous)  

## Principal.fromActor
```motoko
func fromActor(a : actor {  }) : Principal
```

The function `fromActor` takes one `actor` argument and returns a `Principal` value. 
```motoko, run
{{#include _mo/principal0.mo:b}}
```

## Principal.fromText
```motoko
func fromText(t : Text) : Principal
```

The function `fromText` takes one `Text` argument and returns a `Principal` value. 
```motoko, run
{{#include _mo/principal1.mo:a}}
```

## Principal.toText
```motoko
func toText(p : Principal) : Text
```

The function `toText` takes one `Principal` argument and returns a `Text` value. 
```motoko, run
{{#include _mo/principal2.mo:a}}
```

## Principal.toBlob
```motoko
func toBlob(p : Principal) : Blob
```

The function `toBlob` takes one `Principal` argument and returns a `Blob` value. 
```motoko, run
{{#include _mo/principal3.mo:a}}
```

## Principal.fromBlob
```motoko
func fromBlob(b : Blob) : Principal
```

The function `fromBlob` takes one `BLob` argument and returns a `Principal` value. 
```motoko, run
{{#include _mo/principal4.mo:a}}
```

## Principal.isAnonymous
```motoko
func isAnonymous(p : Principal) : Bool
```

The function `isAnonymous` takes one `Principal` argument and returns a `Bool` value. 
```motoko, run
{{#include _mo/principal5.mo:a}}
```
