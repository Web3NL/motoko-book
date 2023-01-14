# If Expression
An *if expression* is constructed with the `if` keyword followed by two expressions. The first expression is enclosed in parenthesis `()` and the second is enclosed with curly braces `{}`. They both evaluate to a value of a certain type.

The first expression after the `if` keyword has to evaluate to a value of type `Bool`. Based on the boolean value of the first expression, the `if` expression will either evaluate the second expression or it doesn't.  

```motoko
let condition = true;

var number = 0;

if (condition) { number += 1};

// number is now 1
```

The first expression evaluates to `true` so the second expression is evaluated and the code inside it is executed. Note we used the `+=` assignment [operator](operators.html) to increment the mutable variable `number`. 

If the first expression evaluates to `false`, then the second expression is **not** evaluated and the *whole* `if` expression will evaluate to the unit type `()` and the program continues.
