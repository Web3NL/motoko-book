# Logical expressions

Logical expressions are used to express common _logical operations_ on values of type `Bool`. There are three types of logical expressions in Motoko.

## `not` expression

The `not` expression takes only one _operand_ of type `Bool` and _negates_ the value:

```motoko, run
{{#include _mo/logical-expressions.mo:a}}
```

In the first line `negate` has boolean value `true`. It is set by negating the boolean _literal_ `false`. In the second line, we negate the _boolean expression_ `(1 > 2)`.

Both `negate` and `yes` are of type `Bool`. This type is [inferred](/common-programming-concepts/types.html).

The _truth table_ for `not` is

| `x`     | `not x` |
| ------- | ------- |
| `true`  | `false` |
| `false` | `true`  |

## `and` expression

The `and` expression takes two _operands_ of type `Bool` and performs a _logical AND_ operation.

```motoko, run
{{#include _mo/logical-expressions1.mo:a}}
```

`result` is now `false` according to the _truth table_.

| `x`     | `y`     | `x and y` |
| ------- | ------- | --------- |
| `true`  | `true`  | `true`    |
| `true`  | `false` | `false`   |
| `false` | `true`  | `false`   |
| `false` | `false` | `false`   |

## `or` expression

The `or` expression takes two _operands_ of type `Bool` and performs a _logical OR_ operation.

```motoko, run
{{#include _mo/logical-expressions2.mo:a}}
```

`result` is now `true` according to the _truth table_.

| `x`     | `y`     | `x 0r y` |
| ------- | ------- | -------- |
| `true`  | `true`  | `true`   |
| `true`  | `false` | `true`   |
| `false` | `true`  | `true`   |
| `false` | `false` | `false`  |
