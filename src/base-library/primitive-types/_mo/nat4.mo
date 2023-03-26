// Nat
// ANCHOR: a
import Nat "mo:base/Nat";

let a : Nat = 50;
let b : Nat = 20;

let isEqual = Nat.equal(a, b);

let isEqualAgain = a == b;
// ANCHOR_END: a