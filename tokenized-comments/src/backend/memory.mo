import Mem "mo:base/ExperimentalStableMemory";
import T "types";
import Result "mo:base/Result";

module {
  public type Pointer = (Nat64, Nat64);

  public class StableMemory() {
    let PAGE : Nat64 = 65535;

    var mem : Nat64 = 0;
    var pages : Nat64 = 0;

    func hasMem(size : Nat64) : Bool {
      
    };

    public func storeComment(c : T.Comment) { 
      ()
    };

    public func loadComment(p : Pointer) : T.Comment {
      
    };
  };
};
