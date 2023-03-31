// FUNCTIONS

actor {

    // ANCHOR: a
    func myFunc(x : Nat) : Nat {
        x;
    };
    // ANCHOR_END: a

    // ANCHOR: b
    func concat(t1 : Text, t2 : Text) : Text {
        let result = t1 # t2;
        result;
    };

    let output = concat("Hello ", "world");
    // ANCHOR_END: b

    // ANCHOR: c
    type Concat = (Text, Text) -> Text;

    let ourFunc : Concat = concat;
    // ANCHOR_END: c

};
