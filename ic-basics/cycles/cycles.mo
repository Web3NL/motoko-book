import PT "modules";
import RB "mo:base/RBTree";
import P "mo:base/Principal";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import List "mo:base/List";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";

actor Cycles {
  type Canister_id = Principal;
  type canister_settings = PT.canister_settings;
  type definite_canister_settings = PT.definite_canister_settings;
  type http_header = PT.http_header;
  type http_response = PT.http_response;
  type wasm_module = PT.wasm_module;

  type PCCWC = {
    settings : ?canister_settings;
    amount : ?Nat;
  };

  type PTUC = {
    Canister_id : Canister_id;
    amount : Nat;
  };

  type ManagementCanisterInterface = PT.ManagementCanister;

  let ManagementCanister = actor ("aaaaa-aa") : ManagementCanisterInterface;

  let tree = RB.RBTree<Nat, User>(Nat.compare);

  type User = {
    principal : Principal;
    username : Text;
    balance : Nat;
  };

  public query func getUser(i : Nat) : async ?User { tree.get(i) };

  public query func size() : async Nat { RB.size(tree.share()) };

  func newUser(i : Nat, user : User) { tree.put(i, user) };

  // let mc : MC = actor ("aaaaa-aa");

  // test cycle cost for n new users
  public shared ({ caller }) func test(n : Nat) : async Nat {

    // get cycles balance
    func get_cycles() : async Nat {
      let status = await ManagementCanister.canister_status({
        canister_id = P.fromActor(Cycles);
      });
      return status.cycles;
    };

    // get cycles balance before creating new users
    let before = await get_cycles();

    for (i in Iter.range(1, n)) {
      newUser(
        i,
        {
          principal = caller;
          username = "name";
          balance = 0;
        },
      );
    };

    // get cycles balance after creating new users
    let after = await get_cycles();

    // return cycle difference
    before - after;
  };


// cycle test in array data structure //////////////////////////////////////////////////////

  var array : [var User] = [var];

   public func array_size() : async Nat {
    array.size();
  };

  public shared ({caller}) func test_array(n : Nat) : async (Nat, Nat) {

 // get cycles balance
    func get_cycles() : async Nat {
      let status = await ManagementCanister.canister_status({
        canister_id = P.fromActor(Cycles);
      });
      return status.cycles;
    };

    // get cycles balance before creating new users
    let before = await get_cycles();

  for (i in Iter.range(1, n)){
    array := Array.init<User>(i, {
          principal = caller;
          username = "name";
          balance = 0;
        })
  };

  // get cycles balance after creating new users
    let after = await get_cycles();

    // return cycle difference
    (before, after)
  };

// cycle test in List data structure //////////////////////////////////////////////////////

type List<T> = ?(T, List<T>);

let myList : ?(Nat, List<Nat>) = List.nil();

public func isNil() : async Bool {
  List.isNil(myList)
};

public func list_size() : async Nat {
  List.size(myList)
};

public shared ({caller}) func test_list(n : Nat) : async (Nat, Nat) {

 // get cycles balance
    func get_cycles() : async Nat {
      let status = await ManagementCanister.canister_status({
        canister_id = P.fromActor(Cycles);
      });
      return status.cycles;
    };

    // get cycles balance before creating new users
    let before = await get_cycles();

  for (i in Iter.range(1, n)){
  let newlist = List.push<Nat>(i, myList);
  };

  // get cycles balance after creating new users
    let after = await get_cycles();

    // return cycle difference
    (before, after)

  };

  // cycle test in Buffer data structure ////////////////////////////////////////////////////

type Buffer<X> = Buffer.Buffer<X>;

let myBuffer : Buffer<Nat> = Buffer.Buffer<Nat>(100);

public shared ({caller}) func Buffer(n : Nat) : async (Nat, Nat) {

 // get cycles balance
    func get_cycles() : async Nat {
      let status = await ManagementCanister.canister_status({
        canister_id = P.fromActor(Cycles);
      });
      return status.cycles;
    };

    // get cycles balance before creating new users
    let before = await get_cycles();

  for (i in Iter.range(1, n)){
  let newlist = List.push<Nat>(i, myList);
  };

  // get cycles balance after creating new users
    let after = await get_cycles();

    // return cycle difference
    (before, after)

  };

};

