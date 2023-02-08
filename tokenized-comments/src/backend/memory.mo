import Mem "mo:base/ExperimentalStableMemory";
import A "mo:base/Array";
import Nat64 "mo:base/Nat64";
import B "mo:base/Blob";
import P "mo:base/Principal";

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
    let P_ENTRY_SIZE : Nat = PSIZE + 8;

    var memPointer : Nat64 = 0;
    var pages : Nat64 = 0;

    var principalPointer : PrincipalPointer = 0;

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

    func initPrincipalList() {      
      let data = A.tabulate<Nat8>(P_ENTRY_SIZE, func(_) {0 : Nat8});
      let blob = B.fromArray(data);

      ignore write(blob)
    };

    initPrincipalList();

    func loadPrincipal(p : PrincipalPointer) : Principal {
      let blob = Mem.loadBlob(p, PSIZE);
      P.fromBlob(blob)
    };

    func storePrincipal(principal : Principal) {
      let blob = P.toBlob(principal);
      let p = write(blob);

      let mem = alloc(Nat64.fromNat(P_ENTRY_SIZE));
      switch (mem) {
        case null assert false;
        case (?offset) {
          write()
          principalPointer := offset;
        }
      }

      

      

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
