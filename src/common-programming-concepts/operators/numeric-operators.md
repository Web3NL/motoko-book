# Numeric operators
Numeric operators are used to perform *arithmetic* operations on number types like `Nat`, `Int` or `Float`. Here's a list of all numeric operators:

- `+`   addition
- `-`   subtraction
- `*`   multiplication
- `/`   division
- `%`   modulo
- `**`  exponentiation

An example:

```motoko
let a : Nat = (2 ** 4) / 4; 
```

We used parentheses `(2 ** 4)` to indicate the order in which the operations need to be performed. The exponentiation happens first and the result is then divided by 4. The end result will be a value of type `Nat`.

The order in which the operations are performed is called *[operator precedence](/common-programming-concepts/operators/numeric-operators.html)*. 

