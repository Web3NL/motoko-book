# Do Block

A _do_ block is constructed by `do` keyword follow by two curly brackets and closed with `;`. Within the brackets can be _statements_ and _declarations_ that are in order executed with the last line as the evaluation to a _result value_ of `type ()`. 
This is a special kind of control flow used in places where a block expressions can not be used.

```motoko
do { 
    let x = 5;
    let y = 2;
    x * y 
}

// evaluates to 10
```

All variables within these are privately scoped. They can have the same names as other variables in the parent scope without interference. These blocks can now also be binded to a variable.

```motoko
let y = 10;

let x = do { 
    let x = 5;
    let y = 2;
    x * y 
};

x * y

// evaluates to 100
```

We could also rewrite this by enclosing the `do {}`in parentheses, so it can be used in another compound expression.

```motoko
let y = 10;

y * (do { 
    let x = 5;
    let y = 2;
    x * y 
})

// evaluates to 100
```

Beware that outside variables can still be used within the block aslong as they are not redefined within its private scope. If we remove `let y = 2` then our do block evaluation will use the variable `y` outside its scope.

```motoko
let y = 10;

y * (do { 
    let x = 5;
    x * y 
})

// evaluates to 500
```

## Do Option Block

A _do option_ block is written by adding a question mark `?` after the `do` keyword. The result of the do block will now have an optional null value, this value is achieved by having _atleast_ one imperative null break within this block by using an exclamation mark `!` with or without a space in between. If the associated expression is null then it will abort the do block and result in a null value.

Let's introduce an unknown variable of type ?Nat called `z` .

```motoko

do ? { 
    let x = 5; 
    let y = 2; 
    x * y * z ! 
}

// (z = 10)   evaluates to 100
// (z = 0)   evaluates to 0
// (z = null) evaluates to null
```

These null breaks can also be used as the result of more complex expressions or statements inside the option block, often used as a way to check for certain conditions.

In this example we add an if statement to prevent `z` from being of value 0, forcing the input to be atleast a positive natural number.

```motoko

do ? {
    if (z ! == 0) null ! ; 
    //if (z == ?0) null ! ; could also be used
    let x = 5;
    let y = 2;
    x * y * z !
}

// (z = 10)   evaluates to 100
// (z = 0)   evaluates to null
// (z = null) evaluates to null
```

Beware of the exclamation marks after the `null` result , this is still needed here to be able to abort the do block. 

In practice we would often use functions to check and call our data within the do block to maintain code readability. So let's extract the if statement as a function. 

The null break `!` can be used in the beginning of  the `z` declaration during the function call, resulting in the block to be aborted _without_ further execution. 

```motoko
func noZero(x: ?Nat) : ?Nat {
    if (x == ?0) null else x;
};

do ? {
    let z = noZero(n) ! ;
    let x = 5;
    let y = 2;
    x * y * z
}
```
Or the null break `!` is put in a later stage or last expression, allowing the previous lines of code to be executed _before_ the null break aborts the block.

```motoko
func noZero(x: ?Nat) : ?Nat {
    if (x == ?0) null else x;
};

do ? {
    let z = noZero(n);
    let x = 5;
    let y = 2;
    x * y * z !
}
```

## Side Effects

If we use the `ignore` keyword and combine all of our actions using the `do ?` , we can stop the whole block of actions as soon as any one of them fails (i.e., returns null). This means we don't waste time running any more failed actions, and we can move on to other parts of our program.

Whatever happens inside this block of actions, the final value that it returns will be ignored. This allows our program to continue running without being affected by the outcome of these actions.

This is for example useful for testing certain code or other specific _side effects_.


```motoko
ignore do ? {
    let z = noZero(n)!;
    let x = getSome()!;
    let y = calcSome(x)!;
    Debug.print(multiply(x, y, z)!);
};

// evaluates to 'nothing' as any return value is ignored
// But as a side effect, there might be a console output if the block's expressions did not fail.
```
