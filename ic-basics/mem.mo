import Prim "mo:⛔";
import Nat "mo:base/Nat";
import List "mo:base/List";
import Iter "mo:base/Iter";

actor {
    var l = List.nil<Nat64>();

    public query func rts() : async [Text] { 
        [
            "version: " # Prim.rts_version(),
            "memory_size: " # Nat.toText(Prim.rts_memory_size()),
            "heap_size: " # Nat.toText(Prim.rts_heap_size()),
            "total_allocation: " # Nat.toText(Prim.rts_total_allocation()),
            "reclaimed: " # Nat.toText(Prim.rts_reclaimed()),
            "max_live_size: " # Nat.toText(Prim.rts_max_live_size()),
        ]
    };

    public func push(n : Nat) : async Nat {
        for (i in Iter.range(1,n)) {
            l := List.push(0 : Nat64, l)
        };
        Prim.rts_heap_size()
    }
};
