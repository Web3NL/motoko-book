// Nat
// ANCHOR: a
import Nat "mo:base/Nat";

let a : Nat = 50;
let b : Nat = 20;

let subtract = Nat.sub(a, b);

// Result has type `Int` because subtracting two `Nat` may trap due to undeflow
let subtraction : Int = a - b; // ANCHOR_END: a
