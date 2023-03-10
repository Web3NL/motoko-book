# Operator precedence

## Operator precedence
Consider the following example:

```motoko
let q : Float = 1 + 2 - 3 * 4 / 5;
```

We used 4 common arithmetic operations in one line. The result is a value of type `Float` and will be named `q`.

If we would perform the operations from left to right, we would do the following: 
- We add 1 to 2 giving us 3
- We then subtract 3 from 3 giving us 0
- We multiply 0 with 4 giving us 0
- We divide 0 by 5 giving us 0

But if we run this code in Motoko, the value of `q` will be `0.6`! The reason for this is that the operations are **not** performed from left to right. Multiplication and division are performed first, followed by addition and subtraction. 

Multiplication and division have a *higher precedence* than addition and subtraction. Every operator has a certain 'priority' compared to other operators. To see all the precedence rules of which operators are applied before others, checkout the [official docs](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/language-manual#operator-and-keyword-precedence).

To ensure an operation happens first before any other, we can enclose the values and the operator inside parenthesis.

```motoko
let q : Float = ((1 + 2) - 3) * 4 / 5;
```

The value of `q` is now `0`.
