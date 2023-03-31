// MUTABLE ARRAYS

// ANCHOR: a
var numbers : [var Nat] = [var 8, 8, 3, 0];

numbers[2] := 10; // mutate the value inside the array

numbers := [var 1]; // mutate the value of the variable

numbers := [var]; // mutate the value of the variable
// ANCHOR_END: a
