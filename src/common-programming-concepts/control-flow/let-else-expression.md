# Let-Else

The let-else declaration is a way to declare bindings with a default value. 
We learned about let bindings, which has a pattern on the left side and an expression on the right side, both with `type T`. 

```motoko
let x = 3;
```

With Let-Else we introduce an `else` keyword on the right side, followed with a block/expression `{}`.
Whenever a pattern match failure occurs with the let binding, the else block will execute its content. 
Beware, if the right side expression of let would `trap` then the program `traps` and the else block will not be executed.
The else block however has to return a value of `type None` , so only imperative control flow statements can be used as the last return value like: `return`, `break`, `continue`, `throw`.
Remember that let-else declarations are immutable, meaning that they cannot be changed once assigned. If you try to assign a new value to the same identifier, you will get an error.

```motoko
let x = 3 else return "Error"; 
// This will succeed and bind

let x = null else return "Error"; 
// This will fail and return "Error"
```

In common practice, our let-else expression might have an `Opt type`. By putting a questionmark `?` in front of the let pattern we can bind this `Opt Value` and desugar it by using its pattern name without the `?`. We now can evaluate expressions with Opt types , and imperatively act or bind accordingly to their result type.

```Motoko
let by = ", by ";

let ?writer = input.name else return #err("Error: no name");
let ?msg = input.message else return #err("Error: no message");

#ok(msg # by # writer)
```

These constructs are really usefull when we have multiple functions and processes that have to be called or checked on, sometimes in a logical order. 
On failure of one of such expressions we can easily control the flow and exit the function or a parent construct like a `label` with a desired result. 

Here is an example showcasing some possibilities with let-else declarations, assuming we have a list of users, and a set of predefined functions.

```motoko
let p = user.principal;

let null = isBlacklisted(p) else return #err("user is blacklisted)
let balance = getBalance(p) else return #err("value not found");
let ?debt = getOptionalDebt(p) else return #err("debt not found");

let ?newBalance = payDebt(p, debt) else return #err("could not pay debt);

#ok(balance, newBalance)
```

`isBlacklisted()` would check wether a user is not blacklisted, in that case it will return `null`, the pattern match will succeed and execution continues. 
Incase a user is found it might return a value of some type, evaluating in a failed pattern match and returning the program with an `#err`. 
This can be usefull in some situations where we want to do a simple check while having a possible custom return and maintaining code consistency to its surroundings without the need of any binded values to be later used.

`getBalance()` would find a balance associated with the user and bind it.

`getOptionalDebt()` would return a value of `Opt type T`. So we can expect a value or null. 
By putting a questionmark `?` in front of the let pattern we can bind this `Opt Value` and desugar it by using its pattern name without the `?`.

`payDebt()` would take an extra input; the desugared debt constant. It would try to extract the debt from the balance amount, and binds the new balance. For any other reasons it could fail and return a null value, evaluating as a failed pattern match and an `#err` would be returned. 


