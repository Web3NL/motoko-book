// Nat
// ANCHOR: a
import Nat "mo:base/Nat";

let a : Nat = 50;
let b : Nat = 20;

let isLess = Nat.less(a, b);

let less = a < b;
// ANCHOR_END: a