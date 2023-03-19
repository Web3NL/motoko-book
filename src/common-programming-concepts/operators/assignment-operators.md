# Assignment operators
We already encountered the most common assignment operator in [mutability](/common-programming-concepts/mutability.html), which is the `:=` operator. There are [many](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/language-manual#assignment-operators) assignment operators in Motoko. Lets just focus on some essential ones here:

- `:=`	assignment (in place update)
- `+=`	in place add
- `-=`  in place subtract
- `*=`  in place multiply
- `/=`  in place divide 
- `%=`  in place modulo
- `**=` in place exponentiation

Lets use all of them in an example:

```motoko, run
{{#include _mo/assignment-operators.mo:a}}
```
```motoko, run
{{#include _mo/assignment-operators1.mo:a}}
```
```motoko, run
{{#include _mo/assignment-operators2.mo:a}}
```
```motoko, run
{{#include _mo/assignment-operators3.mo:a}}
```
```motoko, run
{{#include _mo/assignment-operators4.mo:a}}
```
```motoko, run
{{#include _mo/assignment-operators5.mo:a}}
```

We started by declaring a mutable variable named `number`, we annotated its name with the type `Int` and set its value equal to `5`. Then we *mutate* the variable multiple times using *assignment operators*. 




