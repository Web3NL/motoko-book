import Mem "mo:base/ExperimentalStableMemory";
import A "mo:base/Array";
import Nat64 "mo:base/Nat64";
import B "mo:base/Blob";

import T "types";


// MEM LAYOUT
// A: 29 + 8 = 37 for PrincipalList

module {
  type Pointer = (Nat64, Nat64);

  type PrincipalPointer = Nat64;
  type PrincipalList = (?Blob, ?PrincipalPointer);

  type IsReported = Nat8;

  type TotalLikes = Nat64;
  type TotalReports = Nat64;

  type LikeList = (?PrincipalPointer, ?Nat64);
  type ReportList = (?PrincipalPointer, ?Nat64);

  type CommentData = Blob;

  type StoredComment = (
    IsReported, 
    TotalLikes,
    TotalReports,
    LikeList, 
    ReportList,
    CommentData,
  );

  public type CommentPointer = (Nat64, Nat64);

  public class StableMemory() {
    let PAGE : Nat64 = 65536;
    let PSIZE : Nat = 29;

    var memPointer : Nat64 = 0;
    var pages : Nat64 = 0;

    func initPrincipalList() {
      // type PrincipalList = (?Blob, ?PrincipalPointer);
      // type PrincipalPointer = Nat64;
      let listSize = PSIZE + 8;
      
      let data = A.tabulate<Nat8>(listSize, func(_) {0 : Nat8});
      let blob = B.fromArray(data);

      ignore write(blob)
    };

    func write(data : Blob) : ?Pointer {
      let bytes = Nat64.fromNat(data.size());
      let offset = alloc(bytes);
      switch (offset) {
        case null return null;
        case (?mem) { 
          Mem.storeBlob(mem, data);
          ?(mem, bytes) 
        };
      };
    };


    func alloc(bytes : Nat64) : ?Nat64 {
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




// ------------------------------
    // totalComments() : Nat

    // storeComment(c : T.Comment) : CommentPointer
    // loadComment(p : CommentPointer) : T.Comment

    // markReported(p : CommentPointer)

    // likeComment(p : CommentPointer, principal : Principal)
    // reportComment(p : CommentPointer, principal : Principal)

    // totalLikes(p : CommentPointer) : Nat
    // totalReports(p : CommentPointer) : Nat

    // balance(principal : Principal) : Nat
    // addToBalance(principal : Principal, amount : Nat)

    // likeList(p : CommentPointer) : [Principal]
    // reportList(p : CommentPointer) : [Principal]

    // storeScore(score : Nat)
    // loadScore(p : CommentPointer) : Nat
    
  };
};
