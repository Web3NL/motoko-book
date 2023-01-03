// FUNCTIONS

actor {

    // func myFunc() {};

    // private func myFunc(x : Nat) {
    //     // function body
    // };

    // private func myFunc(x : Nat) : Nat {
    //     return x;
    // };

    func myFunc(x : Nat) : Nat {
        x
    };

    func concat(t1 : Text, t2 : Text) : Text {
        let result = t1 # t2;
        result
    };

    let output = concat("Hello ", "world");

};
