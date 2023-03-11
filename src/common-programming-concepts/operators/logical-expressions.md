# Logical expressions

Logical expressions are used to express common [*logical operations*] on values of type `Bool`. There are three types of logical expressions in Motoko.

## not

The `not` expression takes only one _operand_ of type `Bool` and _negates_ the value:

```motoko
let true = not false;

let yes = not (1 > 2);
```

In the first line `true` is a variable name and `false` is a `Bool` _literal_ which is being negated.

In the second line, we negate the _boolean expression_ `(1 > 2)`.

Both `true` and `yes` are of type `Bool`. This type is [inferred](/common-programming-concepts/types.html).

The _truth table_ for `not` is   

|`x`|`not x`|
|---|---|
|true|false|
|false|true|


## and

The `and` expression takes two _operands_ of type `Bool` and performs a _logical AND_ operation.

```motoko
let result = true and false;
```

`result` is now `false` according to the _truth table_.

|`x`|`y`|`x and y` |
|---|---|---|
|true|true|true|
|true|false|false|
|false|true|false|
|false|false|false|

## or

The `or` expression takes two _operands_ of type `Bool` and performs a _logical OR_ operation.

```motoko
let result = true or false;
```

`result` is now `true` according to the _truth table_.

|`x`|`y`|`x 0r y` |
|---|---|---|
|true|true|true|
|true|false|true|
|false|true|true|
|false|false|false|
