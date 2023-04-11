// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let array1 = [7, 8, 1];

func concat(a : Nat, b : Text) : Text {
    b # Nat.toText(a);
};

let base : Text = "Numbers: ";

Array.foldRight<Nat, Text>(array1, base, concat);
// ANCHOR_END: a
