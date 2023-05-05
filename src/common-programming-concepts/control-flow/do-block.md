# Do Block

A _do_ block is constructed by `do` keyword follow by two curly brackets and closed with `;`. Within the brackets can be _statements_ and _declarations_ that are in order executed with the last line as the evaluation to a _result value_ of `type ()`. 
This is a special kind of control flow used in places where a block expressions can not be used.

```motoko
{{#include _mo/do-block.mo:a}}
```

All variables within these are privately scoped. They can have the same names as other variables in the parent scope without interference. 
These blocks can now also be binded to an outside variable, in this case we also call it `x`.

```motoko
{{#include _mo/do-block.mo:b}}
```

We could also rewrite this by enclosing the `do {}`in parentheses, so it can be used in another compound expression. Lets try to add the first y into the calculation.

```motoko
{{#include _mo/do-block.mo:c}}
```

Beware that outside variables can still be used within the block aslong as they are not redefined within its private scope. If we remove `let y = 2` then our do block evaluation will use the variable `y` outside its scope.

```motoko
{{#include _mo/do-block.mo:d}}
```
