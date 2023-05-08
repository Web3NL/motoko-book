import Star "Star";

actor {
    type Result = Star.Star<Text, Text>;

    var state = 0;
    public query func read() : async Nat { state };

    public func incr() : async Result { 
        state += 1;
        #trappable "state incr" 
    };

    public func reset() : async Result { 
        state := 0;
        #trappable "state reset" 
    };

    public func trap(trap : Bool) : async Result {
        state += 1;
        if (trap) { ignore 0/0 };

        #trappable "did not trap"
    };
};
