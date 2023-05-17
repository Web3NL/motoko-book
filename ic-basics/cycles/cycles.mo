import PT "publicType";
import RB "mo:base/RBTree";
import P "mo:base/Principal";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import List "mo:base/List";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";
import Nat32 "mo:base/Nat32";
import Arr "modules/arrray";
import Buff "modules/buffer";
import HM "modules/hashmap";
import L "modules/list";
// import arrray "canister:../arrray";


actor Cycles {

  type ManagementCanisterInterface = PT.ManagementCanister;

  let ManagementCanister = actor ("aaaaa-aa") : ManagementCanisterInterface;


  
  func get_cycles() : async Nat {
    let status = await ManagementCanister.canister_status({
      canister_id = P.fromActor(Cycles);
    });
    return status.cycles;
  };



// cycle test in array data structure //////////////////////////////////////////////////////

    let array : [var User] = [var];

    public func array_size() : async Nat {
        array.size();
    };

   public func test_array(n : Nat) : async* Nat {

        // get cycles balance before creating new users
        let before = await* cyc.get_cycles();

        for (i in Iter.range(1, n)) {
            array := Array.init<User>(
                i,
                {
                    principal = P.fromActor(a);
                    username = "name";
                    balance = 0;
                },
            );
        };
        // get cycles balance after creating new users
        let after = await* cyc.get_cycles();

        // return cycle difference
        (after - before);
    };



  // factor out get_cycles as an async* func in top level
  // test all 5 data structures systematically
  // test write amounts for 10, 100, 1000, 10_000
  public func write_test() : async (Nat, Nat, Nat, Nat) {
    (
      await* arr.test_array(10),
      await* test_array(100),
      await* test_array(1000),
      await* test_array(10000),
    );
  };
  // test read amounts for 10, 100, 1000, 10_000
  // test delete amounts for 10, 100, 1000, 10_000

  // produce a text report
  // Example:
  // Tested 10 writes into Hashmap: x cycles
  // Tested 100 writes into Hashmap: x cycles
// sahara!nd!@
};
