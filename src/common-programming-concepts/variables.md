# Variables

A variable is a *value* that has an arbitrary *name*. It is defined by a *declaration*.

A variable is declared as follows:

```motoko
let myVariable = 0;
```

The *let* keyword indicates we are declaring a variable. The name of the variable is *myVariable*. The value that is named is `0`.

The convention is to use `lowerCamelCase` for variable names. 

`let` declarations declare *immutable* variables. This means the value cannot change after it is declared.

Some examples of immutable variables:

```motoko
let x = 12;

let temperature = -5;

let city = "Amsterdam";

let isNotFunny = false;
```

A declaration ends with a *semicolon* `;`

The convention is to use spaces around the equals sign. 

The declarations above all span one line but a declaration may span several lines as long as it ends with a semicolon.

*Source file: [variables.mo](variables.mo)*