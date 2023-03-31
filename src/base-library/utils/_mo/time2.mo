// Time

// ANCHOR: a
import Time "mo:base/Time";

actor {
    type Time = Time.Time;

    func time1() : Time { Time.now() };

    public shared query func time2() : async Time { Time.now() };

    public shared func time() : async (Time, Time, Time) {
        let t1 = time1();
        let t2 = await time2();
        let t3 = Time.now();

        (t1, t2, t3);
    };
};
// ANCHOR_END: a
