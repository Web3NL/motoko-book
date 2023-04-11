# For
A `for` loop allows you to execute a block of code repeatedly for **a specified number of times**.
It is constructed by a `for` keyword followed by  a `pattern` , `in`,  and an `interator` enclosed in parenthesis `()` followed up by a code block curly braces `{}`. 
The values are drawn from an iterator (link to chapter Iterators) and bound with the same loop pattern. Commonly used patterns for these interactions are tuples and objects. 

```motoko
{{#include _mo/for.mo:a}}
```

Iterating over a fixed value range can also be done by using `Iter.range(Nat,Int)`, where `pattern` will be equal to the current iteration index. See more at chapter Iter. (link to iter chapter)

Iterating over some built-in data structures can be done by using pre-defined iterators. (including mutable arrays)

|Type    |Iterator   |Element                   |
|--------|-----------|--------------------------|
|`[T]`   |`vals`     |array elements `T`        |
|`[T]`   |`keys`     |array valid indices `Nat` |
|`Text`  |`chars`    |text chars `Char`         |
|`Blob`  |`vals`     |blob bytes `Nat8`         |

Now lets try out with a simple array called `users`. We also define an empty text var named `userList`.

```motoko
{{#include _mo/for.mo:b}}
```

Here we iterate over every element of the array users and concad each element with `userList`.
The resulting var `userList` would be "Amy, Bonnie, Chris".

Now let's try a more complex situation: 

```motoko
{{#include _mo/for.mo:c}}
```

In this example we added a var `balance` and an array `donations` of tuples consisting of a name and a value. We also added a label named `bl` to the loop and an if-statement inside it.

During iteration there will first be checked if the current balance is above 600, in that case a `break bl`is called to exit the labeled loop block immediately. 
Remember that this is **imperative control flow** and will skip any other expressions that were still left to be executed inside the block.

If the balance has not been reached yet, then it wil continue its expression and add the corresponding donation value to balance, and name to userList.






