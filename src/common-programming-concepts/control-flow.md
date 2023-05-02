# Control Flow
Control flow is a programming language feature that _controls_ the order in which statements are _executed_. There are two key types of control flow:

1.  Declarative: the structure of a value guides control and selects the next expression. Examples are `if` and `switch`.
    
2.  Imperative: a hard coded command abruptly changes control , which supersedes regular control flow. Examples of such commands are `break`, `continue`, `return`, and `throw`.

Some of the control flow constructs are called _expressions_ because they _evaluate_ to a value of a certain type. Examples are `if`, `if else`, `switch`, `do` and `let else`.

Others are loops that iterate over a certain value. Examples are `for` and `while`. 

## Block Expressions

Block expressions are blocks of statements and declarations that are defined by enclosing curly brackets `do { }`. They are used to form the sub-expressions of above control flow constructs.

Remember that these evaluate to an `expression` of `type ()` !  Unlike some other use-cases of curly brackets that would evaluate to an object literal of `type {}` 

## Loops
A simple loop in Motoko will iterate and execute its expressions infinitely.

`loop {
 Debug.print("Hello, world!");
}`

This will keep outputting the same text. The only way to exit such loop would be with `continue` or `break` construct in accordance with a label.

Useful for loops that have to run infinitely but most of the time we will want to use conditional statements attached to it in the form of `for` and `while` as we will see further in this chapter.
 

## Labels
Any expression or looping construct can have a prefixed label name. 
These are useful for imperatively changing control flow inside its construct. Labels can also have a type, but this is not commonly used.
As a developer you will mostly use this for asserting certain conditions during an iteration and handling exceptional cases.

 - Labeled loops can use `continue` to skip the current iteration,  and `break`to exit the whole loop.
 (code example)
 - Labeled expressions that are typed can use `break` to circum-vent the rest of the expression and return a value immediately. 
(code example)




