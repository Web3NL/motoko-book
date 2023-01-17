# Modules and Imports
Modules, like [objects](/common-programming-concepts/objects-and-classes/objects.html), are a collection of named variables, types, functions (and possibly more items) that together serve a special purpose. Modules help us *organize* our code. A module is usually defined in its own separate source file. It is meant to be *imported* in a Motoko program from its source file. 

Modules are like a *limited* version of objects. We will discuss their [limitations](#static-expressions-only) below. 


## Imports
 Lets define a simple module in its own source file `module.mo`:

```motoko
{{#include _mo/module.mo:a}}
```

This module has two fields, one private, one public. Like in the case of objects, only the public fields are 'visible' from the outside.

Lets now *import* this module from its source file and use its public field:

```motoko
{{#include _mo/modules1.mo:a}}
```

We use the `import` keyword to import the module into our program. Lines starting with `import` are only allowed at the top of a Motoko file, before anything else.

We *declared* a new name `MyModule` for our module. And we referenced the module source file `module.mo` by including it in double quotes without the `.mo` extension.

We then used its public field `name` by referencing it through our chosen module name `MyModule`. In this case we assigned this `name` text value to a newly declared variable `person`.

## Nested modules
Modules can contain other modules. Lets write a module with two *child* modules. 

```motoko
{{#include _mo/module-nested.mo:a}}
```

The top-level module has two *named* child modules `Person` and `Info`. The one is public, the other is private. 

The public contents of the `Info` module are only visible to the top-level module. In this case the public `place` variable is assigned the value of the public field `city` inside the private `Info` child module.  

Only the sub-module `Person` and variable `place` are accessible when imported.  

```motoko
{{#include _mo/modules2.mo:a}}
```

## Public functions in modules
A module exposes a *public API* by defining public functions inside the module. In fact, this is what modules are mostly used for. A module with a very simple API could be:

```motoko
{{#include _mo/module-public-functions.mo:a}}
```

This module has a private constant `MAX_SIZE` only available to the module itself. It's a convention to use capital letters for constants. 

It also has a public function `checkSize` that provides some functionality. It takes an argument and computes an inequality using the private constant and the argument.

We would use this module like this:

```motoko
{{#include _mo/modules3.mo:a}}
```

We used our newly chosen module name `SizeChecker` to reference the public function inside the module and call it with an argument `x` from the main file. 

The expression `SizeChecker.checkSize(x)` evaluates to a `Bool` value and thus can be used as an argument in the if expression. 

##  Static expressions only
Modules are limited to *static* expressions only. This means that no computations can take place inside the module. Static means that no program is running. A module only defines code to be used elsewhere for computations. 

A function call is non-static. Computations, like adding and multiplying are also non-static. Therefore the following code is not allowed inside modules:

```motoko
{{#include _mo/modules3.mo:b}}
```

The first line in the module tries to compute `1 + 1` which is a 'dynamic' operation. The second line tries to define a function which makes an internal computation, another non-static operation. 

The last function `compute` is allowed because it only defines *how* to perform a computation, but does not actually perform the computation. Instead it is meant to be imported somewhere, like in an [actor](/internet-computer-programming-concepts/actors.html), to perform the computation on any values passed to it. 

## Module type
Module types are not used often in practice, but they do exist. Modules have types that look almost the same as object types. A type of a module looks like this:

```motoko
{{#include _mo/modules1.mo:a}}
```
 This type describes a module with two public fields, one being a `Nat` and the other being a function of type `() -> ()`.
