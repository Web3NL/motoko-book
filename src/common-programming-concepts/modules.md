# Modules and Imports

Modules, like [objects](/common-programming-concepts/objects-and-classes/objects.html), are a collection of named variables, types, functions (and possibly more items) that together serve a special purpose. Modules help us _organize_ our code. A module is usually defined in its own separate source file. It is meant to be _imported_ in a Motoko program from its source file.

Modules are like a _limited_ version of objects. We will discuss their [limitations](#static-expressions-only) below.

## Imports

Lets define a simple module in its own source file `module.mo`:

```motoko
module {
  private let x = 0;
  public let name = "Peter";
};

```

This module has two fields, one private, one public. Like in the case of objects, only the public fields are 'visible' from the outside.

Lets now _import_ this module from its source file and use its public field:

```motoko
{{#include _mo/modules1.mo:a}}
```

We use the `import` keyword to import the module into our program. Lines starting with `import` are only allowed at the top of a Motoko file, before anything else.

We _declared_ a new name `MyModule` for our module. And we referenced the module source file `module.mo` by including it in double quotes without the `.mo` extension.

We then used its public field `name` by referencing it through our chosen module name `MyModule`. In this case we assigned this `name` text value to a newly declared variable `person`.

## Nested modules

Modules can contain other modules. Lets write a module with two _child_ modules.

```motoko
module {
  public module Person {
    public let name = "Peter";
    public let age = 20;
  };

  private module Info {
    public let city = "Amsterdam";
  };

  public let place = Info.city;
};
```

The top-level module has two _named_ child modules `Person` and `Info`. The one is public, the other is private.

The public contents of the `Info` module are only visible to the top-level module. In this case the public `place` variable is assigned the value of the public field `city` inside the private `Info` child module.

Only the sub-module `Person` and variable `place` are accessible when imported.

```motoko
// main.mo
import Mod "module-nested";

let personName = Mod.Person.name;

let city = Mod.place;
```

## Public functions in modules

A module exposes a _public API_ by defining public functions inside the module. In fact, this is what modules are mostly used for. A module with a very simple API could be:

```motoko
module {
  private let MAX_SIZE = 10;

  public func checkSize(size : Nat) : Bool {
    size <= MAX_SIZE;
  };
};
```

This module has a private constant `MAX_SIZE` only available to the module itself. It's a convention to use capital letters for constants.

It also has a public function `checkSize` that provides some functionality. It takes an argument and computes an inequality using the private constant and the argument.

We would use this module like this:

```motoko
{{#include _mo/modules3.mo:a}}
```

We used our newly chosen module name `SizeChecker` to reference the public function inside the module and call it with an argument `x` from the main file.

The expression `SizeChecker.checkSize(x)` evaluates to a `Bool` value and thus can be used as an argument in the if expression.

## Public types in modules

Modules can also define private and public _types_. Private types are meant for internal use only, like private variables. Public types in a module are meant to be imported and used elsewhere.

Types are declared using the `type` keyword and their _visibility_ is specified:

```motoko
module {
  private type UserData = {
    name : Text;
    age : Nat;
  };

  public type User = (Nat, UserData);
};
```

Only the `User` type is visible outside the module. Type `UserData` can only be referenced inside a module and even used in a public type (or variable or function) declaration as shown above.

### Type imports and renaming

Types are often given a local _type alias_ (renamed) after importing them:

```motoko
{{#include _mo/modules5.mo:a}}
```

In the example above, we first import the module from file `types.mo` and give it the _module name_ `User`.

Then we define a new _type alias_ also named `User`, again using the `type` keyword. We reference the imported type by module name and type name: `User.User`.

We often use the same name for the module, the type alias and the imported type!

## Public classes in modules

Modules can also define private and public [_classes_](/common-programming-concepts/objects-and-classes/classes.html). Private classes are rarely used internally. Public classes on the other hand are used widely. In fact, most modules define one _main class_ named after the module itself. Public classes in a module are meant to be imported and used elsewhere as 'factories' for objects.

Classes in modules are declared using the `class` keyword and their _visibility_ is specified:

```motoko
module {
  public class MyClass(x : Nat) {
    private let start = x ** 2;
    private var counter = 0;

    public func addOne() {
      counter += 1;
    };

    public func getCurrent() : Nat {
      counter;
    };
  };
};
```

The class `MyClass` is visible outside the module. It can only be _instantiated_ if it is imported somewhere else, due to [static limitations](#static-expressions-only) of modules. Our class takes in one initial argument `x : Nat` and defines two internal private variables. It also exposes two public functions.

### Class imports and class referencing

Classes in modules are imported from the _module source file_ they are defined in. This file often has the same name as the class! Further more, the module alias locally is also given the same name:

```motoko
{{#include _mo/module-classes2.mo:a}}
```

In the example above, we first import the module from source file `MyClass.mo` and give it the _module name_ `MyClass`.

Then we instantiate the class by referring to it starting with the module name and then the class `MyClass.MyClass(0)`. The `0` is the initial argument that our class takes in.

We often use the same name for the module file name, the module local name and the class!

## Static expressions only

Modules are limited to _static_ expressions only. This means that no computations can take place inside the module. Static means that no program is running. A module only defines code to be used elsewhere for computations.

A function call is non-static. Computations, like adding and multiplying are also non-static. Therefore the following code is not allowed inside modules:

```motoko
module {
  // public let x = 1 + 1;

  // public func compute() {
  //     8 - 5
  // };

  public func compute(x : Nat, y : Nat) : Nat {
    x * y;
  };
};
```

The first line in the module tries to compute `1 + 1` which is a 'dynamic' operation. The second line tries to define a function which makes an internal computation, another non-static operation.

The last function `compute` is allowed because it only defines _how_ to perform a computation, but does not actually perform the computation. Instead it is meant to be imported somewhere, like in an [actor](/internet-computer-programming-concepts/actors.html), to perform the computation on any values passed to it.

## Module type

Module types are not used often in practice, but they do exist. Modules have types that look almost the same as object types. A type of a module looks like this:

```motoko
type MyModule = module {
  x : Nat;
  f : () -> ();
};
```

This type describes a module with two public fields, one being a `Nat` and the other being a function of type `() -> ()`.
