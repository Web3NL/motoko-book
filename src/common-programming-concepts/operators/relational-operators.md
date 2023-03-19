# Relational operators
Relational operators are used to *relate* or compare two values. The result of the comparison is a value of type `Bool`.

- `==`  is equal to
- `!=`  is not equal to
- `<=`	is less than or equal to
- `>=`	is greater than or equal to
- `<`	is less than **(must be enclosed in whitespace)**
- `>`	is greater than **(must be enclosed in whitespace)**

Some examples:

```motoko, run
{{#include _mo/relational-operators1.mo:a}}
```

```motoko, run
{{#include _mo/relational-operators2.mo:a}}
```

```motoko, run
{{#include _mo/relational-operators3.mo:a}}
```

In the first line we compared two `Nat` values. The result is the value `false` of type `Bool`.

Notice how we type annotated the *value* itself in the second line, therefore telling Motoko that we are now comparing two `Int` values. The result is the value `true` of type `Bool`.  

In the last line we compared two `Float` values. The result is the value `true` of type `Bool`.

