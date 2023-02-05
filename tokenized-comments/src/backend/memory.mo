import Mem "mo:base/ExperimentalStableMemory";
import T "types";
import Result "mo:base/Result";

module {
  public type Pointer = (Nat64, Nat64);

  public class StableMemory() {

    public func storeComment(c : T.Comment) { 
      ()
    };

    public func loadComment(p : Pointer) : T.Comment {
      ()
    };

    public func 
  };
};
