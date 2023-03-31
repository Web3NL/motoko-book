// Nat
// ANCHOR: a
import Nat "mo:base/Nat";

let a : Nat = 50;
let b : Nat = 50;

let isLessOrEqual = Nat.lessOrEqual(a, b);

let lessOrEqual = a <= b;
// ANCHOR_END: a
