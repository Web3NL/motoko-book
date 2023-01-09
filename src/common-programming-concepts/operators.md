# Operators
Operators are symbols that indicate several kinds of *operations* on values. They consist of one, two or three characters and are used to perform manipulations on typically one or two values at a time.

```motoko
let x = 1 + 1; 
```

The `+` character in the example above serves as an addition operator, which performs an *arithmetic operation*. 

In this chapter we will cover several kinds of operators, namely `numeric`, `relational` and `assignment` operators. 

## Numeric operators
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

The order in which the operations are performed is called *[operator precedence](#operator-precedence)*. 

## Relational operators
Relational operators are used to *relate* or compare two values. The result of the comparison is a value of type `Bool`.

- `==`  is equal to
- `!=`  is not equal to
- `<=`	is less than or equal to
- `>=`	is greater than or equal to
- `<`	is less than **(must be enclosed in whitespace)**
- `>`	is greater than **(must be enclosed in whitespace)**

Some examples:

```motoko
let b = 2 > 3;

let c = (2 : Int) >= 2;

let d = 1.61 == 1.61;
```

In the first line we compared two `Nat` values. The result is the value `false` of type `Bool`.

Notice how we type annotated the *value* itself in the second line, therefore telling Motoko that we are now comparing two `Int` values. The result is the value `true` of type `Bool`.  

In the last line we compared two `Float` values. The result is the value `true` of type `Bool`.

## Assignment operators

We already encountered the most common assignment operator in [mutability](mutability.html), which is the `:=` operator. There are [many](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/language-manual#assignment-operators) assignment operators in Motoko. Lets just focus on the three most essential ones here:

- `:=`	assignment (in place update)
- `+=`	in place add
- `-=`  in place subtract

Lets use all of them in an example:

```motoko
var number : Int = 5;

number += 2;

number -= 10;

number := 0;
```

We started by declaring a mutable variable named `number`, we annotated its name with the type `Int` and set its value equal to `5`.

In the second line, we used the `+=` operator to add the value `2` to the value of `number` and store the end result in the same `number` variable. The value of our variable is now 7. 

In the third line we subtract 10, leaving us with a value of -3 for our variable `number`. 

In the last line, we don't care about the value of the variable and just assign it a whole new value, discarding its old value. Our `number` now has the value `0`.

## Text operator
Checkout the chapter on [functions](functions.html) to see an example of the text concatenation operator `#`.

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

But if we run this code in Motoko, the value of `q` will be `0.6`! The reason for this is that the operations are not performed from left to right. Multiplication and division are performed first, followed by addition and subtraction. 

Multiplication and division have a *higher precedence* than addition and subtraction. Every operator has a certain 'priority' compared to other operators. To see all the precedence rules of which operators are applied before others, checkout the [official docs](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/language-manual#operator-and-keyword-precedence).   

*Source file: [operators.mo](operators.mo)*