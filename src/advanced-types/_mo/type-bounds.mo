// TYPE BOUNDS

// ANCHOR: example
import Int "mo:base/Int";
import Float "mo:base/Float";

func makeNat<T <: Number>(x : T) : Number {
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


// ANCHOR: a
type N = {
    #N : Nat;
};

type I = {
    #I : Int;
};

type F = {
    #F : Float;
};
// ANCHOR_END: a

// ANCHOR: b
type Number = I or N or F;
// ANCHOR_END: b

