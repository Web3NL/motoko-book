# Modules and Imports
Modules, like [objects](/common-programming-concepts/objects-and-classes/objects.html), are a collection of named variables, types, functions (and possibly more items) that together serve a special purpose. A module is usually defined in its own separate source file. It is meant to be *imported* in a Motoko program from its source file. 

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

```motoko
{{#include _mo/modules2.mo:a}}
```

## Public functions in modules
A module exposes a *public API* by defining public functions inside the module. In fact, this is what modules are mostly used for. A module with a very simple API could be:

```motoko
{{#include _mo/module-public-functions.mo:a}}
```

And we would use it like this:

```motoko
{{#include _mo/modules3.mo:a}}
```


##  Static expressions only
This is not allowed
    var x = 0; 

## Module type
Module types are not used often in practice, but they do exist. Modules have types that look almost the same as object types. A type of a module looks like this:

```motoko
{{#include _mo/modules1.mo:a}}
```
 This type describes an empty module, that is, a module without any public fields. 
