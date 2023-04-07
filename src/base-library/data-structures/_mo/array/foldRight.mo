// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let array = [7, 8, 1];

func combine(a : Nat, b : Text) : Text {
    Nat.toText(a) # b;
};

let sum = Array.foldRight<Nat, Text>(array, "", combine);
// ANCHOR_END: a
