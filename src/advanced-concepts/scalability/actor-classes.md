# Actor Classes

In the same way [classes](/common-programming-concepts/objects-and-classes/classes.html) are _constructor functions_ for [objects](/common-programming-concepts/objects-and-classes/objects.html), similarly _actor classes_ are _constructors_ for actors. An _actor class_ is like a template for _programmatically_ creating actors of a specific [actor type](/internet-computer-programming-concepts/actors.html#actor-type).

But unlike ordinary [_public classes_](/common-programming-concepts/modules.html#public-classes-in-modules) (that are usually declared inside a [module](/common-programming-concepts/modules.html#modules-and-imports)), a single _actor class_ is written in its own separate `.mo` file and is [_imported_](#actor-class-import) like a module.

See ['Actor classes'](https://internetcomputer.org/docs/current/motoko/main/actor-classes/) and ['Actor classes generalize actors'](https://internetcomputer.org/docs/current/motoko/main/actors-async/#actor-classes-generalize-actors) in the official documentation for more information.

> **NOTE**  
> _For programmatically managing actor classes, also check out [Actor class management](https://internetcomputer.org/docs/current/motoko/main/language-manual#actor-class-management)_

## A simple actor class

```motoko
{{ #include _mo/actor-class.mo:a}}
```

We use the `actor class` keywords followed by a name with parentheses `User()` and an optional input argument list, in this case `username : Text`.

The body of the actor class, like any actor, may contain [_variables_](/common-programming-concepts/variables.html), [_private_](/common-programming-concepts/functions.html#private-functions) or [_shared functions_](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors), [_type declarations_](/common-programming-concepts/modules.html#public-types-in-modules), [_private `async*` functions_](/advanced-concepts/async-programming.html#async-and-await-1), etc.

## Actor class import

We import the actor class like we would import a [module](/common-programming-concepts/modules.html#modules-and-imports).

```motoko
{{ #include _mo/main.mo:a}}
```

We [import](/common-programming-concepts/modules.html#modules-and-imports) the actor class from `actor-class.mo`, a file in the same directory. We chose the name `User` for the module to represent the actor class.

The [module type](/common-programming-concepts/modules.html#module-type) of `User` now looks like this:

```motoko
module {
    type User = {
        getName: query () -> async Text;
        setName: Text -> async ();
    };
    User : (Text) -> async User;
};
```

This module contains two fields:

1. **The type of the actor that we can 'spin up' with this actor class.**  
   In this case, the actor type `User` consists of two [shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors), one of which is a [query function](/internet-computer-programming-concepts/actors.html#public-shared-query).

1. **The constructor function that creates an actor of this type.**  
   The function `User` takes a `Text` argument and returns a future `async User` for an actor of type `User`.

> **NOTE**  
> _In the module above, the name `User` is used as the name of a type and a function, see [imports](/common-programming-concepts/modules.html#imports). The line `User : (Text) -> async User;` first uses the name `User` as function name and then as a type name in `async User`._

## Installing an instance of an actor class

The function `User : (Text) -> async User` can be called and [`await`ed](/advanced-concepts/async-programming.html#async-and-await) from an [_asynchronous context_](/advanced-concepts/async-programming.html#messaging-restrictions) from within a running actor. Lets refer to this actor as the **Parent** actor.

The `await` for `User` initiates an _install_ of a new instance of the actor class as a new '**Child**' actor running on the IC.

```motoko
let instance = await User.User("Alice");
```

A new canister is created with the **Parent** actor as the single [controller](/project-deployment/canister-status.html#canister-status) of the new canister.

The `await` yields an actor `actor {}` with actor type `User`. This actor can be stored locally in the **Parent** actor and used as a reference to interact with the **Child** actor.

## Multi-canister scaling

Whenever you need to scale up your application to multiple actors (running in multiple canisters), you could use actor classes to repeatedly install new instances of the same actor class.

```motoko
{{ #include _mo/main2.mo:a}}
```

This actor declares a [Buffer](/base-library/data-structures/buffer.html) of type `Buffer<User.User>` with `User.User` (our actor type from our [actor class module](#actor-class-import)) as a [generic type parameter](/advanced-types/generics.html#type-parameters-and-type-arguments). The buffer is named `users` and has initial capacity of `1`. We can use this buffer to store _instances_ of newly created actors from our actor class.

The shared function `newUser` takes a `Text` and uses that as the argument to `await` the function `User.User`. This yields a new actor named `instance`.

We add the new actor to the buffer (`users.add(instance)`) to be able to interact with it later.

Finally, we return the principal of the new actor by calling `Principal.fromActor(instance)`.

> **NOTE**  
> _On the IC we actually need to provide some [cycles](/base-library/ic-apis/experimental.html#experimentalcycles) with the call to the actor constructor `User.User()`. On Motoko Playground, this code may work fine for testing purposes._

## Calling child actors

The last example is not very useful in practice, because we can't interact with the actors after they are installed. Lets add some functionality that allows us to call the shared functions of our **Child** actors.

```motoko
{{ #include _mo/main3.mo:a}}
```

We added two [shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) `readName` and `writeName`. They both take a `Nat` to index into the `users` buffer. They use the `getOpt` function ('method' from the [Buffer Class](/base-library/data-structures/buffer.html#class-methods)) in a [switch expression](/common-programming-concepts/control-flow/switch-expression.html) to test whether an actor exists at that index in the buffer.

If an actor exists at that index, we bind the name `user` to the actor instance and so we can call and `await` the shared functions of the **Child** actor by referring to them like `user.getName()`. Otherwise, we throw an [Error](/advanced-concepts/async-programming.html#errors).
