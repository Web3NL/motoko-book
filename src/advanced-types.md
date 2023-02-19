# Advanced Types
Motoko has a modern *type system* that allows us to write powerful, yet concise code. In this chapter we will look at several features of Motoko's type system.

Understanding Motoko's type system is essential when we write code that is more sophisticated than what we have done up to this point.

- Generic types are widely used in [types declarations](/common-programming-concepts/types.html#the-type-keyword), [functions](/common-programming-concepts/functions.html) and [classes](/common-programming-concepts/objects-and-classes/classes.html) inside [modules](/common-programming-concepts/modules.html) of the [Base Library](/base-library.html).  
- Sub-typing is essential when we want to develop [actor interfaces](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) that remain *backwards compatible* with older versions.
- Recursive types are powerful when defining [core data structures](/base-library/data-structures.html). 