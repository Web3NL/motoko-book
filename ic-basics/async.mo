import M "mod";
import Star "Star";

actor {
    var state = 0;
    public query func read() : async Nat { state };
    public func reset() : async () { state := 0 };

    public func await_(n : Nat) : async Nat { state := n; n };

    func test(n : Nat, (b1 : Bool, b2 : Bool)) : async* Star.Star<Nat, Text> {
        switch (b1, b2) {
            case (true, true) {
                let result = await await_(n);
                #awaited result;
            };

            case (true, false) {
                #trappable n;
            };

            case (false, true) {
                let result = await_(n);
                #err(#awaited "committed");
            };

            case (false, false) {
                #err(#trappable "not committed");
            };
        };
    };

    public func test_(n : Nat, (b1 : Bool, b2 : Bool)) : async Star.Star<Nat, Text> {
        await* test(n, (b1, b2))
    };

    public query func a() : async (n : Nat, (b1 : Bool, b2 : Bool)) {
        (0, (true, true))
    };
};
