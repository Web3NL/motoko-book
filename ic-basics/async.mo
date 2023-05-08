import M "mod";
import Star "Star";

actor {
    type Result = Star.Star<Text, Text>;

    type A = actor {
        read : shared () -> async Nat;
        incr : shared () -> async Nat;
        trap : shared Bool -> async ();
    };
    let a : A = actor ("by6od-j4aaa-aaaaa-qaadq-cai");

    var state = 0;
    public query func read() : async Nat { state };
    public func reset() : async () { state := 0 };
};
