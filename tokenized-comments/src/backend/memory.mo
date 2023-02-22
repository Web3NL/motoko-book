import Mem "mo:base/ExperimentalStableMemory";
import Iter "mo:base/Iter";
import Nat64 "mo:base/Nat64";
import D "mo:base/Debug";

import Types "types";
import Constants "constants";

module {
    let PAGE_SIZE : Nat64 = 65536;

    public func memHeight() : ?Nat64 {
        let pages = Mem.size();
        if (pages == 0) return ?0;

        var address = (pages - 1) * PAGE_SIZE;

        let BLOB_SIZE : Nat64 = Nat64.fromNat(Constants.PRINCIPAL_SIZE) + 64;

        let range = Iter.range(1, Nat64.toNat(PAGE_SIZE / BLOB_SIZE));
        for (i in range) {
            let blob = Mem.loadBlob(address, Nat64.toNat(BLOB_SIZE));
            let balance : ?Types.Balance = from_candid(blob);
            switch (balance) {
                case null return ?address;
                case (_) { address += BLOB_SIZE};
            };
        };
        ?(pages * PAGE_SIZE + 1)
    };

    public func storeBalance(offset : Nat64, balance : Types.Balance) {
        let BLOB_SIZE = Constants.PRINCIPAL_SIZE + 64;
        let blob = to_candid(balance);
        
        debug {D.print(debug_show(blob.size()))};
        
        if (blob.size() != BLOB_SIZE) assert false;

        Mem.storeBlob(offset, blob)
    };
  
};