# Classes
Classes in essence are nothing more than a *function* with a fancy name and special notation. A class, like any other function, takes in values of a certain type and returns a value of a certain type. The return type of a class is always an [object](objects.html). Classes are like 'factories' or 'templates' for objects. 

Consider the following two type declarations:

```motoko
{{#include _mo/classes1.mo:a}}
```

The first is the type of an empty object. The second is the type of a class. It's a function type that could take in a number of arguments and return an *instance* of an object of type `SomeObject`.

But classes have a special notation using the `class` keyword. We declare a class like this:

```motoko
{{#include _mo/classes1.mo:b}}
```

To use this class we have to create an instance of this class:

```motoko
{{#include _mo/classes1.mo:c}}
```

When we *instantiate* our class by calling `MyClass()` it returns an object. That object is now named `myClassInstance`.

In fact, we could test the expected type of the returned object by defining the type and annotating our variable with it:

```motoko
{{#include _mo/classes1.mo:d}}
```

Now this class is not very useful and we could just have declared an object in stead of declaring a class and instantiating it. 

Let declare a class that takes some arguments, instantiate two objects with it and use those objects:

```motoko
{{#include _mo/classes1.mo:e}}
```

Lets analyze the code line by line. Our class `CryptoAccount` takes in two values of type `Nat`. These are used once during initialization. 

The first member of our class is a private function named `calc`. It just takes two values of type `Nat` and returns their product. The second member of the class is a mutable variable named `balance` which is declared by calling `calc` with the two values coming from our class. 

Because the class only has one `public` field, the expected type of the object that is returned should be `{ var balance : Nat }`.

We then define two objects `account1` and `account2` by calling our class with different values. Both objects have a mutable public field named `balance` and we can use that to mutate the value of each. 

## Public functions in classes
The real power of classes is that they yield objects with *state* and a *public API* that operates on that state. The state could be any mutable variable, array or any other value that sits inside the object. The public API consists of one or more functions that operate on that state. 

Here's an example:

```motoko
{{#include _mo/classes2.mo:a}}
```

Our `CryptoAccount` class takes the same two arguments as before, but now has only two members. One is the public mutable `balance` variable. The second is a *public function*. Because there are two public fields, the expected type of the object returned from this class is 

    { 
        pay : () -> Nat; 
        balance : Nat; 
    }

After instantiating the `account` variable with our class, we can access the public function by calling it as a *method* of our object. When we write `account.pay(50)` we call that function, which in turn mutates the internal state of the object.

In this example the public function happens to operate on a public variable. It could also have mutated a private mutable variable of any type. 