# Functions

We begin our treatment of functions in this chapter by discussing a subset of possible functions in Motoko, namely *private* functions. We will explain private function arguments, argument type annotation, return type and the type of the function itself. 

Private functions in Motoko may appear in `Actors`, `Modules`, `Objects`, `Classes` and other places as well.    

Other possible functions will be discussed in upcoming chapters: 
- [`Objects and Classes`](objects-and-classes.html): public and private functions inside an object or class
- [`Modules`](modules.html): public and private functions inside a module
- [`Actors`](/internet-computer-programming-concepts/actors.html): update, query and oneway functions
- [`Async Messages`](/internet-computer-programming-concepts/async-messages.html): shared and caller-identifying functions
- [`Upgrades`](/advanced-concepts/upgrades.html): system upgrade functions

# Private functions
Lets start with most simple function in Motoko: 

```motoko
func myFunc() {};
```

The `func` keyword is indicating a *function declaration*. `myFunc` is an arbitrary name of the function followed by two parenthesis `()` and two curly brackets `{}`. The `()` are used for function *arguments* and the `{}` are used for the function *body*.

**Note:** The `()` in this context is not the same as the [unit type](types.html)!

We could *explicitly* tell Motoko that this is a private function by using the `private` keyword in front of the `func` keyword. This is not necessary though, because a function declaration defaults to a private function in Motoko unless declared otherwise. 

Lets be more explicit about our private function, add one argument as an input and expand the body:

```motoko
private func myFunc(x : Nat) {
    // function body
};
```

The function is now marked private. All arguments **must** be annotated. Type inference doesn't work here. In this case we take in one argument and name it `x`. We also type annotate it with `Nat`. 

Lets proceed by adding a return type to this function and actually returning a value of that type:

```motoko
private func myFunc(x : Nat) : Nat {
    return x;
};
```

After the function arguments we annotate the *return type* of this function with `: Nat`. If we don't annotate the return type of a private function, it defaults to the unit `()` return type.  

Inside the body we return `x`, the same variable that was passed to the function. This is allowed because `x` also has type `Nat`, which is the expected return type for this function.

Lets simplify this useless function:

```motoko
func myFunc(x : Nat) : Nat {
    x
};
```

We removed the private keyword and simplified the return expression to just `x`. Even the semicolon `;` is gone. But note that we can't leave out the type annotations, like we did with variables. Type inference doesn't work on function declarations except for the defaulting unit type behavior mentioned above. 

Lets write a useful private function and *call* it:

```motoko
func concat(t1 : Text, t2 : Text) : Text {
    let result = t1 # t2;
    result
};

let output = concat("Hello ", "world");
```

Our function `concat` takes to arguments of type `Text`. It also returns a `Text` type. 

We use the `#` sign to *concatenate* the two arguments and assign the result to a new variable. Concatenation with `#` only works for `Text` types. 

The result of the concatenation `t1 # t2` is another `Text`. We did not type annotate the variable `result`. Motoko automatically infers this for us. 

We return `result` by placing it at the last line of the function without a `return` keyword and semicolon `;`. You could be explicit by adding the return keyword and even type annotate the `result` variable with a `: Text` type, but in this case it is not necessary. 

Lastly, we *call* this function with two text *literals* as the arguments and assign its result to the variable `output`. Again, we don't have to annotate the type of this `output` variable, because this is obvious from the context and Motoko will infer this information for us. 

# Function type
The last concept for this chapter is the type of the *whole* function. A function's *typed arguments* and *return type* together are used to define a type for the function as a whole. The type of the function `concat` above is the following:

```motoko
type Concat = (Text, Text) -> Text;

let ourFunc : Concat = concat;
```

We used the type name `Concat` to define a new type `(Text, Text) -> Text`. This is the type of our function `concat`. The function type is constructed by joining three things: 
- a *tuple of types* for the function argument types
- the `->` keyword
- the *return type* of the function

We use the `Concat` type to annotate the type of another variable `ourFunc` and assign the function name `concat` to it without the parenthesis and arguments like we did when we called the function. We basically renamed our function to `ourFunc`. 

**Note:** All functions above are placed inside an [actor](/internet-computer-programming-concepts/actors.html)

*Source file: [functions.mo](functions.mo)*