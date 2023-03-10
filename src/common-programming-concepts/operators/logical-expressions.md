# Logical expressions

Boolean expressions are used to represent logical conditions in programming. The three main Boolean operators are not, and, and or. Let's look at each of them with a simple example:

## not
The not operator negates the value of a Boolean expression. For example, not True is False, and not False is True. Here's an example of how not can be used in a programming language:

```motoko
let x : Nat = 10;
let y : Nat = 20;
let z : Bool = x > y;
let result : Bool = not z;
assert result == true;
```

In this example, we're comparing x and y, and storing the result in z. Since x is not greater than y, z is False. Then we apply the not operator to z, resulting in True. So the value of result is True.

## and
The and operator returns True if both operands are True, and False otherwise. For example, True and False is False, and True and True is True. Here's an example of how and can be used.

```motoko
let x : Nat = 10;
let y : Nat = 20;
let result : Bool = x > 5 and y < 30;
assert result == true;
```

In this example, we're checking if both x is greater than 5 and y is less than 30. Since both conditions are true, the value of result is True.

## or
The or operator returns True if at least one of the operands is True, and False otherwise. For example, True or False is True, and False or False is False. Here's an example of how or can be used.

```motoko 
let x : Nat = 10;
let y : Nat = 20;
let result: Bool = x < 5 or y > 30;
assert result == false;
```

In this example, we're checking if either x is less than 5 or y is greater than 30. Since neither condition is true, the value of result is False.

