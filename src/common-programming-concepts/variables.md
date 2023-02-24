# Variables

A variable is a *value* that has a *name*. It is defined by a *declaration*.

A variable is declared as follows:

```motoko
{{#include _mo/variables.mo:a}}
```

The *let* keyword indicates we are declaring a variable. The name of the variable is `myVariable`. The value that is named is `0`.

Variable names must start with a letter, may contain lowercase and uppercase letters, may also contain numbers 0-9 and underscores `_`. 

The convention is to use `lowerCamelCase` for variable names. 

`let` declarations declare *immutable* variables. This means the value cannot change after it is declared.

Some examples of immutable variables:

```motoko
{{#include _mo/variables.mo:b}}
```

A declaration ends with a *semicolon* `;`

The convention is to use spaces around the equals sign. 

The declarations above all span one line but a declaration may span several lines as long as it ends with a semicolon.

