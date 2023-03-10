# Assignment operators
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


