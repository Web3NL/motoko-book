module {
    type A = actor {
        read : shared () -> async Nat;
        incr : shared () -> async Nat;
        trap : shared Bool -> async ();
    };
    let a : A = actor ("by6od-j4aaa-aaaaa-qaadq-cai");

    public func foo() : async* (){
        ignore await a.incr();
    };
}