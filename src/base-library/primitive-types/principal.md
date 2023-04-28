> **BETA WARNING** _This chapter is being reviewed and updated_

# Principal

To understand this _principal module_, it might be helpful to learn about [Principles](/internet-computer-programming-concepts/principals-and-authentication.html) first.

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/principal/principal.mo:a}}
```

### Conversion

[Function `fromActor`](#principalfromactor)  
[Function `fromText`](#principalfromtext)  
[Function `toText`](#principaltotext)  
[Function `toBlob`](#principaltoblob)  
[Function `fromBlob`](#principalfromblob)

### Utility

[Function `isAnonymous`](#principalisanonymous)  
[Function `hash`](#principalhash)  

### Comparison

[Function `equal`](#principalequal)    
[Function `notEqual`](#principalnotequal)    
[Function `less`](#principalless)  
[Function `lessOrEqual`](#principallessorequal)    
[Function `greater`](#principalgreater)    
[Function `greaterOrEqual`](#principalgreaterorequal)  
[Function `compare`](#principalcompare)    


## Principal.fromActor

```motoko
func fromActor(a : actor {  }) : Principal
```

The function `fromActor` takes one `actor` value and returns a `Principal` value.

```motoko, run
{{#include _mo/principal/fromActor.mo:a}}
```

## Principal.fromText

```motoko
func fromText(t : Text) : Principal
```

The function `fromText` takes one `Text` value and returns a `Principal` value.

```motoko, run
{{#include _mo/principal/fromText.mo:a}}
```

## Principal.toText

```motoko
func toText(p : Principal) : Text
```

The function `toText` takes one `Principal` value and returns a `Text` value.

```motoko, run
{{#include _mo/principal/toText.mo:a}}
```

## Principal.toBlob

```motoko
func toBlob(p : Principal) : Blob
```

The function `toBlob` takes one `Principal` value and returns a `Blob` value.

```motoko, run
{{#include _mo/principal/toBlob.mo:a}}
```

## Principal.fromBlob

```motoko
func fromBlob(b : Blob) : Principal
```

The function `fromBlob` takes one `BLob` value and returns a `Principal` value.

```motoko, run
{{#include _mo/principal/fromBlob.mo:a}}
```

## Principal.isAnonymous

```motoko
func isAnonymous(p : Principal) : Bool
```

The function `isAnonymous` takes one `Principal` value and returns a `Bool` value.

```motoko, run
{{#include _mo/principal/isAnonymous.mo:a}}
```
## Principal.hash

```motoko
func hash(principal : Principal) : Hash.Hash
```

The function `hash` takes one `Principal` value and returns a `Hash` value.

```motoko, run
{{#include _mo/principal/hash.mo:a}}
```
## Principal.equal

```motoko
func equal(principal1 : Principal, principal2 : Principal) : Bool
```

The function `equal` takes two `Principal` value and returns a `Bool` value.

```motoko, run
{{#include _mo/principal/equal.mo:a}}
```
## Principal.notEqual

```motoko
func notEqual(principal1 : Principal, principal2 : Principal) : Bool
```

The function `notEqual` takes two `Principal` value and returns a `Bool` value.

```motoko, run
{{#include _mo/principal/notEqual.mo:a}}
```
## Principal.less

```motoko
func less(principal1 : Principal, principal2 : Principal) : Bool
```

The function `less` takes two `Principal` value and returns a `Bool` value.

```motoko, run
{{#include _mo/principal/less.mo:a}}
```
## Principal.lessOrEqual

```motoko
func lessOrEqual(principal1 : Principal, principal2 : Principal) : Bool
```

The function `lessOrEqual` takes two `Principal` value and returns a `Bool` value.

```motoko, run
{{#include _mo/principal/lessOrEqual.mo:a}}
```
## Principal.greater

```motoko
func greater(principal1 : Principal, principal2 : Principal) : Bool
```

The function `greater` takes two `Principal` value and returns a `Bool` value.

```motoko, run
{{#include _mo/principal/greater.mo:a}}
```
## Principal.greaterOrEqual

```motoko
func greaterOrEqual(principal1 : Principal, principal2 : Principal) : Bool
```

The function `greaterOrEqual` takes two `Principal` value and returns a `Bool` value.

```motoko, run
{{#include _mo/principal/greaterOrEqual.mo:a}}
```
## Principal.compare

```motoko
func compare(principal1 : Principal, principal2 : Principal) : {#less; #equal; #greater}
```

The function `compare` takes two `Principal` value and returns an [Order](/base-library/utils/order.html) value.

```motoko, run
{{#include _mo/principal/compare.mo:a}}
```