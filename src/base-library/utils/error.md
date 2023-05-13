> **BETA WARNING** _This chapter is being reviewed and updated_

# Error

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/error.mo:a}}
```

## Error.reject

The function `reject` takes `Text` argument and returns an `Error` value.

```motoko
{{#include _mo/error.mo:b}}
```

## Error.code

The function `code` takes `Error` argument and returns an `Errorcode` value.

```motoko
{{#include _mo/error.mo:c}}
```

## Error.message

The function `message` takes `Error` argument and returns a `Text` value.

```motoko
{{#include _mo/error.mo:b}}
```

