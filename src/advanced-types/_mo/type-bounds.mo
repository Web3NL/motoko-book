// TYPE BOUNDS

// ANCHOR: example
import Int "mo:base/Int";
import Float "mo:base/Float";

func makeNat<T <: Number>(x : T) : Natural {
    switch (x) {
        case (#N i) {
            #N i
        };
        case (#I i) {
            #N (Int.abs(i))
        };
        case (#F i) {
            let rounded = Float.nearest(i);
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

type FloatingPoint = {
    #F : Float;
};
// ANCHOR_END: a

// ANCHOR: b
type Number = Natural or Integer or FloatingPoint;
// ANCHOR_END: b

