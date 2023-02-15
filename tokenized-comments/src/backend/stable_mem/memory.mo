import Mem "mo:base/ExperimentalStableMemory";
import Nat64 "mo:base/Nat64";
import D "mo:base/Debug";

import T "../types";

module {
  public type Pointer = (Nat64, Nat64);
  public type StateArgs = ?(Nat64, Nat64);

  public class StableMemory(args : StateArgs) {
    // Page size = 64kiB
    let PAGE : Nat64 = 65536;

    var memPointer : Nat64 = 0;
    var pages : Nat64 = 0;

    switch (args) {
      case null {};
      case (?args) {
        memPointer := args.0;
        pages := args.1;
      };
    };

    public func stateArgs() : StateArgs { ?(memPointer, pages) };

    func alloc(bytes : Nat64) : ?Nat64 {
      // Max alloc size is one page = 64kiB
      if (bytes > PAGE) { return null };

      let freeMem = ((pages * PAGE) - memPointer);  
      if (freeMem < bytes) { 
          ignore Mem.grow(1);
          pages += 1; 
      };
      
      let pointer = memPointer;
      memPointer += bytes;

      ?pointer
    };

    public func write(data : Blob) : ?Pointer {
      let bytes = Nat64.fromNat(data.size());
      D.print(Nat64.toText(bytes));

      let offset = alloc(bytes);
      switch (offset) {
        case null return null;
        case (?memPointer) { 
          Mem.storeBlob(memPointer, data);
          ?(memPointer, bytes) 
        };
      };
    };

    public func read(p : Pointer) : ?Blob {
      let offset = p.0;
      let readSize = p.1;
      ?Mem.loadBlob(offset, Nat64.toNat(readSize))
    };
  };
};