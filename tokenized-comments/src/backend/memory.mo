import Mem "mo:base/ExperimentalStableMemory";
import Iter "mo:base/Iter";
import Nat64 "mo:base/Nat64";
import D "mo:base/Debug";
import P "mo:base/Principal";

import Types "types";
import Constants "constants";

module {
    let PAGE_SIZE : Nat64 = 65536;

    public func memHeight() : ?Nat64 {
        var pages = Mem.size();
        if (pages == 0) {
            ignore Mem.grow(1);
            pages += 1;
            return ?0
        };

        var address : Nat64 = (pages - 1) * PAGE_SIZE;

        let BLOB_SIZE : Nat64 = 52;

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
        let blob = P.toBlob(balance.0);
        if (blob.size() != 29) assert false;

        let data = to_candid(balance);
        
        Mem.storeBlob(offset, data)
    };
  
};