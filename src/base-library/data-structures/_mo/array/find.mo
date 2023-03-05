import Array "mo:base/Array";
// ANCHOR: a
let ages = [18, 25, 31, 37, 42, 55, 62];

func isGreaterThan40(ages: Nat) : Bool {
     ages > 40
};

let firstAgeGreaterThan40 : ?Nat = Array.find<Nat>(ages, isGreaterThan40)

// ?42 : Nat
// ANCHOR_END: a