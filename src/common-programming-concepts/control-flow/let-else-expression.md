# Let-Else

The let-else declaration is a way to declare bindings with a default value. 
We learned about let bindings, which has a _[variable declaration](common-programming-concepts/variables.md)_ . 

With Let-Else we introduce an `else` keyword on the right side, followed with a sub-expression `{}`.
In common practice, `let-else` will also have an option type `?` in front of the _[variable declaration](common-programming-concepts/variables.md)_ ,
With this we can evaluate expressions with an optional `null`value.

<!-- ```Motoko
let ?x = getData() else { return #err("No data!")} ; 
``` -->


```Motoko
{{#include _mo/let-else.mo:a}}
```

If a _[pattern match](common-programming-concepts/pattern-matching.md)_ failure occurs 
The last line in the else block however has to return a value of type `None` , so the imperative control flow statements can be used as the last return value like: `return`, `break`, `continue`, `throw`.

If the let declaration would trap then the program traps and the `else` block will not be executed.


```Motoko
{{#include _mo/let-else.mo:b}}
```

These constructs are really usefull when we have multiple functions and processes that have to be called or checked on, sometimes in a logical order. 
On failure of one of such expressions we can easily control the flow and exit the overal function or a parent construct like a `label`. 

`let-else` can be powerful control flow tools to handle complex logic, have readable code and to prevent `switch` or `do` nesting chaos.

Let's take the previous example of our _[switch](common-programming-concepts/control-flow/switch-expression.md)_ expression and remake it with a let-else.

```Motoko
{{#include _mo/let-else.mo:c}}
```

<!-- 
## 
Here is an example showcasing some possibilities with let-else declarations, assuming we have a list of users, and a set of predefined functions.

```motoko
let p = user.principal;

// prepare data
let null = isBlacklisted(p) else return #err("user is blacklisted");
let balance = getBalance(p) else return #err("value not found");
let ?debt = getOptionalDebt(p) else return #err("debt not found");

// act on data
let ?newBalance = payDebt(p, debt) else return #err("could not pay debt");
let ?_ = someSideEffect(p, newBalance) else return #err("Could not do side effect");

// result
#ok(balance, newBalance)
```

`isBlacklisted()` would check wether a user is not blacklisted, in that case it will return `null`, the _[pattern match](common-programming-concepts/pattern-matching.md)_ will succeed and execution continues. 
Incase a user is found it might return a value of some type, evaluating in a failed pattern match and returning the program with an `#err`. 
This can be usefull in some situations where we want to do a simple check while having a possible custom return and maintaining code consistency to its surroundings without the need of any binded values to be later used.

`getBalance()` would find a balance associated with the user and bind it.

`getOptionalDebt()` would return a value of `Opt type T`. So we can expect a value or null. 
By putting a questionmark `?` in front of the let pattern we can bind this `Opt Value` and desugar it by using its pattern name without the `?`.

`payDebt()` would take an extra input; the desugared debt constant. It would try to extract the debt from the balance amount, and binds the new balance. For any other reasons it could fail and return a null value, evaluating as a failed _[pattern match](common-programming-concepts/pattern-matching.md)_ and an `#err` would be returned.

`someSideEffect()` would take the newBalance and perform some complex side effects with possible intermediate types as result that we might not need here, which is why we bind the result to a wildcard `?_`, the value can be anything. But once the expression returns null then the _[pattern match](common-programming-concepts/pattern-matching.md)_ fails and the else block will execute and return an error.

If we don't want to return an error when the side effect might fail then you could use an `ignore do {}` block for this but here we showcase how it can also be used in this instance, which makes the overal code look more streamlined.  -->