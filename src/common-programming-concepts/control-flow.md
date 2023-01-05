# Control Flow

Control flow refers to the order in which a program is *executed*. We discuss three common *control flow* constructs in Motoko: `if` expressions, `if else` expressions and `switch` expressions. 

These constructs are called *expressions* because they *evaluate* to a value of a certain type. They also contain expressions. 

# If expression

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

# If Else expression

The `if else` expression starts with an `if` expression followed by the `else` keyword and a third expression also enclosed in curly braces `{}`. When the first expression now evaluates to `false`, the third expression evaluates in stead of returning `()`. 

It looks like this:

```motoko
if (condition) {} else {};
```

To demonstrate that the *whole* `if else` expression evaluates to a value of a certain type, we assign that value to a variable named `result`:

```motoko
let result : Text = if (condition) {
    "condition was true"
} else {
    "condition was false"
}
```

The second and third expression of the `if else` expression (enclosed in curly braces `{}`) must evaluate to a value of the same type. In this case its the `Text` type and therefore the variable `result` has type `Text`.  

# Switch expression

The `switch` expression is a powerful control flow construct that allows [pattern matching](pattern-matching.html) on its input. 

It constructed with the `switch` keyword followed by an input expression enclosed in parenthesis `()` and a code block enclosed in curly braces `{}`. Inside this code block we encounter the `case` keyword once or several times depending on the input. 

```motoko
switch (condition) {
    case (a) {};
};
```

The `case` keyword is followed by a *[pattern](pattern-matching.html)* and an expression in curly braces `{}`. Pattern matching is performed on the input and the possible values of the input are *bound* to the names in the pattern. If the pattern matches, then the expression in the curly braces evaluates. 

Lets switch on a variant as an input:

```motoko
type Color = { #Black; #White; #Blue; };

let color : Color = #Black;

var count = 0;

switch (color) {
    case (#Black) { count += 1 };
    case (#White) { count-= 1 };
    case (#Blue) { count := 0 };
};
```

We defined a variant type `Color`, declared a variable `color` with that type and declared another mutable variable `count` and set it to zero. We then used our variable `color` as the input to our `switch` expression.

After every `case` keyword, we check for a possible value of our variant. When we have a match, we execute the code in the expression defined for that case.

In the example above, the color is `#Black` so the `count` variable will be incremented by one. The other cases will be skipped. 

If all expressions after every `case (pattern)` evaluate to a value of the same type, then like in the example of the `if else` expression, we could assign the return value of the *whole* `switch` expression to a variable or use it anywhere else an expression is expected.

In the example above, our `switch` expression evaluates to `()`.

*Source file [control-flow.mo](control-flow.mo)*