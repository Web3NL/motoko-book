# Error
In programming, errors can occur due to various reasons, such as invalid user input, network errors, or code bugs. Handling these errors is crucial for building reliable and robust applications. The Motoko language provides built-in support for handling errors through the Error module.

The convention is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

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

