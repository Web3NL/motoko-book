// Nat
// ANCHOR: a
import Nat "mo:base/Nat";

let a : Nat = 50;
let b : Nat = 20;

let isNotEqual = Nat.notEqual(a, b);

let notEqual = a != b;
// ANCHOR_END: a