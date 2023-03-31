# If Else Expression

The `if else` expression starts with the `if` keyword followed by two sub-expressions (a condition and its associated branch) and ends with the `else` keyword and a third sub-expression:

```motoko
{{#include _mo/if-else.mo:a}}
```

The condition has to be of type `Bool`. When the condition evaluates to the value `true`, the second sub-expression `1` is returned. When the condition evaluates to the value `false`, the third sub-expression `2` is returned.

When the branches are more complex expressions, they require curly braces:

```motoko
{{#include _mo/if-else.mo:b}}
```

Unlike `if` expressions that lack an `else`, when the first sub-expression of an `if else` evaluates to `false`, the entire `if else` expression evaluates as the third sub-expression, not the unit value `()`.

For example, this `if else` expression evaluates to a value of a certain type `Text`, and we assign that value to a variable named `result`:

```motoko
{{#include _mo/if-else.mo:c}}
```

Generally, the second and third sub-expressions of the `if else` expression must evaluate to a value of the same type.
