# Order
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/order.mo:a}}
```


The Order type is commonly used in programming to represents a set of possible outcomes when comparing two values. 
it is defined as:

```motoko
{{#include _mo/order.mo:b}}
```
The #less variant represents the result of comparing two values where the first value is less than the second value. 
The #equal variant represents the result of comparing two values where both values are equal. 
The #greater variant represents the result of comparing two values where the first value is greater than the second value.

For example, consider the code below. This creates a new variable named order and assigns it the value #less.

```motoko
{{#include _mo/order.mo:c}}
```
## Order.isLess
The function `isLess` takes `Order` argument and returns a `Bool` value. 

```motoko
{{#include _mo/order.mo:d}}
```
## Order.isEqual
The function `isEqual` takes `Order` argument and returns a `Bool` value. 

```motoko
{{#include _mo/order.mo:e}}
```
## Order.isGreater
The function `isGreater` takes `Order` argument and returns a `Bool` value. 

```motoko
{{#include _mo/order.mo:f}}
```
## Order.equal
The function `equal` takes two `Order` argument and returns a `Bool` value. 

```motoko
{{#include _mo/order.mo:g}}
```
