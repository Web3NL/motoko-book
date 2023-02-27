// TYPE BOUNDS

// ANCHOR: example
import Int "mo:base/Int";
import Float "mo:base/Float";

func makeNat<T <: Number>(x : T) : Natural {
    switch (x) {
        case (#N n) {
            #N n
        };
        case (#I i) {
            #N (Int.abs(i))
        };
        case (#F f) {
            let rounded = Float.nearest(f);
            let integer = Float.toInt(rounded);
            let natural = Int.abs(integer);
            #N natural
        };
    };
};
// ANCHOR_END: example

// ANCHOR: example2
assert makeNat( #N 0 ) == #N 0;

assert makeNat( #I (-10) ) == #N 10;

assert makeNat( #F (-5.9) ) == #N 6;
// ANCHOR_END: example2

// ANCHOR: a
type Natural = {
    #N : Nat;
};

type Integer = {
    #I : Int;
};

type Floating = {
    #F : Float;
};

type Number = Natural or Integer or Floating;
// ANCHOR_END: a

