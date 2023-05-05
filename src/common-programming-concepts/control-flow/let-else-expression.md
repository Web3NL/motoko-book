# Let-Else

We learned about let , which has an immutable named _[variable](common-programming-concepts/variables.md)_ declared. 
With Let-Else we introduce an `else` keyword on the right side, followed with a sub-expression `{}`.

```Motoko
let x = expression else { sub-expression }
```
During this declaration, expression will give a value. This value will be binded to x through pattern matching, if this fails then it won't be binded and instead the declaration will continue to `else` and execute its content.
Beware: If expression traps then the whole program traps, the rest of the let-else evalutation won't happen.

```Motoko
let x = 3 else { return };
// this will succeed

let x = null else { return }; 
// this will fail
```

In common practice, `let-else` will also have an option type `?` as named _[variable](common-programming-concepts/variables.md)_ ,
Using this we now can declare expressions with an optional `null` value. When they occur our pattern match will fail and the `else` content is executed.

```Motoko
let b = ?Nat;
let ?x = b else { return };

//b = null will fail
//b = 3 will succeed
```
A real usecase would be for example if we had to get some data by calling a function with inner complexity, and then use or return that data variable for further logic, essentially decoupling from the Opt type.

```Motoko
let ?data = getData() else { return #err "No data!" } ; 
#ok data
```

If a _[pattern match](common-programming-concepts/pattern-matching.md)_ failure occurs 
The last line in the else block has to return a value of type `None` , so the imperative control flow statements can be used as the last return value like: `return`, `break`, `continue`, `throw`.

These constructs are really usefull when we have multiple functions and processes that have to be called or checked on, sometimes in a logical order. 
On failure of one of such expressions we can easily control the flow and exit the overal function or a parent construct like a `label`. 

`let-else` can be powerful control flow tools to handle complex logic, have readable code and to prevent `switch` or `do` nesting chaos.

Let's take the previous example of our _[switch](common-programming-concepts/control-flow/switch-expression.md)_ expression and remake it with a let-else.

```Motoko
{{#include _mo/let-else.mo:a}}
```

Lets add another function called subFee, which will subtract a value called fee from the balance when balance is more than fee. Otherwise it will return an #err;

```Motoko
{{#include _mo/let-else.mo:b}}
```

Let's make a function that combines these 2, and checks in a logical order when one of them has failed.

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