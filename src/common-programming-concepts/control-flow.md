# Control Flow
Control flow is a programming language feature that _controls_ the order in which statements are _executed_. There are two types of control flow:

1.  Declarative: the structure of a value guides control and selects the next expression. Examples are `if` and `switch`.
    
2.  Imperative: a hard coded command abruptly changes control , which supersedes regular control flow. Examples are `break`, `continue`, `return`, and `throw`.

We will discuss 7 commonly used constructs : `if`, `if else`, `switch`, `for`, `while`, `do`, `let else`

These constructs are called _expressions_ because they _evaluate_ to a value of a certain type.

## Labels
Any expression or looping construct  can have a prefixed label name. 
These are useful for imperatively changing control flow inside its construct. Labels can also have a type, but this is not commonly used.
As a developer you will mostly use this for asserting certain conditions during an iteration and handling exceptional cases.

 - Labeled loops can use `continue` to skip the current iteration,  and `break`to exit the whole loop.
 (code example)
 - Labeled expressions that are typed can use `break` to circum-vent the rest of the expression and return a value immediately. 
(code example)