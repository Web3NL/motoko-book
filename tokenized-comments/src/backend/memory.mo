import StableMem "mo:base/ExperimentalStableMemory";
import Result "mo:base/Result";
import Error "mo:base/Error";
import Nat64 "mo:base/Nat64";
import Text "mo:base/Text";

module {
    public type StoreResult = Result.Result<Nat64, Text>;

    public class Mem() {
        let PAGE : Nat64 = 65536;
        let MAX : Nat64 = 1024;

        var pages = 0;
        var mem : Nat64 = 0;

        func pageCheck(n : Nat64) : Bool {
            if (pages == 0) { return false };
            (n + (mem % PAGE)) <= PAGE 
        };

        public func init() : Result.Result<(), Error.Error> {
            let initText = "WEB3NL_MEMORY_INIT";
            let INIT = Text.encodeUtf8(initText);
            let s = INIT.size();

            if (StableMem.size() == 0) {
                ignore StableMem.grow(1);
                pages += 1;
                mem += PAGE;
                
                StableMem.storeBlob(0, INIT);
                #ok()
            } else if (StableMem.size() > 0) {
                let b = StableMem.loadBlob(0, s);
                switch (Text.decodeUtf8(b)) {
                    case (?text) { 
                        if (text == initText) {return #ok()}
                    };
                    case (_) {return #err (Error.reject("Memory init error"))};
                };
            };
            return #err(Error.reject("Memory init error")
        };

        public func storeBlob(b : Blob) : StoreResult {
            let s = Nat64.fromNat(b.size());
            if (s < MAX) {
                if (pageCheck(s)) {
                    StableMem.storeBlob(mem, b);
                    let offset = mem;
                    mem += s;
                    return #ok(offset)
                }; 
            };
            #err "to big"
        };
    }
    


    
}

// init: checks mem empty