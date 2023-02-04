import Mem "memory";
import Result "mo:base/Result";
import Array "mo:base/Array";

actor {

    let mem = Mem.Mem();

    public func size() : async () {
        switch (mem.init()) {
            case (#ok()) ();
            case (_) { assert false };
        };
    };

    public func store() : async Mem.StoreResult {
        let a = Array.tabulate<Nat8>(10, func _ = 255);
        let c = to_candid(a);
        mem.storeBlob(c)
    };


}