# Principal
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/principal.mo:a}}
```

## Principal.fromActor
The function `fromActor` takes one `Actor` argument and returns a `Principal` value. 

```motoko
{{#include _mo/principal.mo:b}}
```

## Principal.toText
The function `toText` takes one `Principal` argument and returns a `textualPrincipal` value. 

```motoko
{{#include _mo/principal.mo:c}}
```

## Principal.fromText
The function `fromText` takes one `textualPrincipal` argument and returns a `Principal` value. 

```motoko
{{#include _mo/principal.mo:d}}
```

## Principal.toBlob
The function `toBlob` takes one `Principal` argument and returns a `Blob` value. 

```motoko
{{#include _mo/principal.mo:e}}
```

## Principal.fromBlob
The function `fromBlob` takes one `BLob` argument and returns a `Principal` value. 

```motoko
{{#include _mo/principal.mo:f}}
```

## Principal.isAnonymous
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