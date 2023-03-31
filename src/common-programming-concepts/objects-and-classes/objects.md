# Objects

Objects, like [records](/common-programming-concepts/types/records.html), are like a collection of named (possibly mutable) variables packaged in curly braces `{}`. But there are four key differences:

- We define an object by using the `object` keyword.
- We specify the _visibility_ of the named variables with either the `public` or `private` keyword.
- We specify the _mutability_ of the named variables with either the `let` or `var` keyword.
- Only `public` variables are part of the type of an object.

Here's a simple example:

```motoko
let obj = object {
    private let x = 0;
};
```

We declared an object by using the `object` keyword before the curly braces. We also declared the variable `x` with the `let` keyword.

The type of this object is the empty object type `{ }`. This is because the `x` variable was declared `private`.

A typed object with a public field could look like this:

```motoko
type Obj = { y : Nat };

let obj : Obj = object {
    private let x = 0;
    public let y = 0;
};
```

We defined the type beforehand, which consists only of one named variable `y` of type `Nat`. Then we declared an object with a `public` variable `y`. We used the object type to annotate the name of the variable `obj`.

Notice that `x` is not part of the type, therefore it is not accessible from outside the object.

The values of the variables inside objects (and inside records as well) could also be a _function_. As we saw in [functions](/common-programming-concepts/functions.html), functions also have a type and they could be assigned to a named variable.

```motoko
let obj = object {
    private func f() {};
    private let x = f;
};
```

Inside the object, we first define a [private function](/common-programming-concepts/functions.html) and then assign that function to a `private` immutable variable `x`. The type of this object is the empty object type `{ }` because there are no public variables.

Lets change the visibility of our `x` variable:

```motoko
let obj = object {
    private func f() {};
    public let x = f;
};
```

This object now has the following type:

```motoko
{ x : () -> () }
```

This is the type of an object with one _field_ named `x`, which is of _function type_ `() -> ()`. We could access this public field like this:

```motoko
{{#include _mo/objects.mo:a}}
```

The first line actually calls the function and assigns the result to `result`. The second line only _references_ the function and renames it.

## Public functions in objects

Lets look at a useful object:

```motoko
let balance = object {
    private let initialBalance = 100;

    public var balance = initialBalance;

    public func addAmount( amount : Nat ) : Nat {
        balance += amount;
        balance
    };
};
```

The first field is a private immutable variable named `initialBalance` with constant value `100`. The second field is a public mutable variable named `balance` initiated with the value of `initialBalance`.

Then we encounter a declaration of a public function named `addAmount`, which takes one argument `amount` of type `Nat` and returns a value of type `Nat`. The function adds the value of `amount` to `balance` using the 'in place add' [assignment operator](/common-programming-concepts/operators.html) and finally returns the new value of `balance`.

This object has the following type:

```motoko
{
    addAmount : Nat -> Nat;
    var balance : Nat;
}
```

This object type has two fields. The `addAmount` field has function type `Nat -> Nat`. And the second field is a `var` mutable variable of type `Nat`.
