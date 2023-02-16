import SM "memory";

import P "mo:base/Principal";
import D "mo:base/Debug";

actor {
    let mem = SM.StableMemory(null);

    var p : ?SM.Pointer = null; 

    public query func stateArgs() : async SM.StateArgs { mem.stateArgs() };

    public shared ({caller = id}) func write() : async ?SM.Pointer {
        p := mem.write(P.toBlob(id));
        p 
    }; 

    public query func read() : async ?Principal {
        switch (p) {
            case null return null;
            case (?p) {
                switch (mem.read(p)) {
                    case null return null;
                    case (?blob) {
                        return ?P.fromBlob(blob)
                    };
                };
            };
        };
    };
}