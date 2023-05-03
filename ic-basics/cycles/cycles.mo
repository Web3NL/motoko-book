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

actor Cycles {

  type ManagementCanisterInterface = PT.ManagementCanister;

  let ManagementCanister = actor ("aaaaa-aa") : ManagementCanisterInterface;

  let tree = RB.RBTree<Nat, User>(Nat.compare);

  type User = {
    principal : Principal;
    username : Text;
    balance : Nat;
  };

  func get_cycles() : async* Nat {
    let status = await ManagementCanister.canister_status({
      canister_id = P.fromActor(Cycles);
    });
    return status.cycles;
  };

  public query func getUser(i : Nat) : async ?User { tree.get(i) };

  public query func size() : async Nat { RB.size(tree.share()) };

  func newUser(i : Nat, user : User) { tree.put(i, user) };

  // let mc : MC = actor ("aaaaa-aa");

  // test cycle cost for n new users
  public shared ({ caller }) func test(n : Nat) : async Nat {

    // get cycles balance before creating new users
    let before = await* get_cycles();

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
    let after = await* get_cycles();

    // return cycle difference
    before - after;
  };

  // cycle test in array data structure //////////////////////////////////////////////////////

  var array : [var User] = [var];

  public func array_size() : async Nat {
    array.size();
  };

 public shared ({ caller }) func test_array(n : Nat) : async (Nat) {

    // get cycles balance before creating new users
    let before = await* get_cycles();

    for (i in Iter.range(1, n)) {
      array := Array.init<User>(
        i,
        {
          principal = caller;
          username = "name";
          balance = 0;
        },
      );
    };

    // get cycles balance after creating new users
    let after = await* get_cycles();

    // return cycle difference
    (after - before);
  };

  // cycle test in List data structure //////////////////////////////////////////////////////

  type List<T> = ?(T, List<T>);

  let myList : ?(User, List<User>) = List.nil();

  public func isNil() : async Bool {
    List.isNil(myList);
  };

  public func list_size() : async Nat {
    List.size(myList);
  };

  public shared ({ caller }) func test_list(n : Nat) : async (Nat, Nat) {

    // get cycles balance before creating new users
    let before = await* get_cycles();

    var array : [var User] = Array.init<User>(
      n,
      {
        principal = caller;
        username = "name";
        balance = 0;
      },
    );

    for (user in array.vals()) {
      let newlist = List.push<User>(user, myList);
    };

    // get cycles balance after creating new users
    let after = await* get_cycles();

    // return cycle difference
    (before, after)

  };

  // cycle test in Buffer data structure //////////////////////////////////////////////////

  let natstorage = Buffer.Buffer<User>(10000);

  public func buffer_size() : async Nat {
    natstorage.size();
  };

  public shared ({ caller }) func test_Buffer(n : Nat) : async (Nat, Nat) {

    // get cycles balance before creating new users
    let before = await* get_cycles();

    for (i in Iter.range(0, n -1)) {
      natstorage.put(
        i,
        {
          principal = caller;
          username = "name";
          balance = 0;
        },
      );
    };

    // get cycles balance after creating new users
    let after = await* get_cycles();

    // return cycle difference
    (before, after)

  };

  // cycle test in hashmap data structure //////////////////////////////////////////////////

  let myMap = HashMap.HashMap<Nat, User>(1000, Nat.equal, func x = Nat32.fromNat(x));

  public func hashmap_size() : async Nat {
    myMap.size();
  };

  public shared ({ caller }) func test_hashmap(n : Nat) : async (Nat, Nat) {

    // get cycles balance before creating new users
    let before = await* get_cycles();

    for (i in Iter.range(1, n)) {
      myMap.put(
        i,
        {
          principal = caller;
          username = "name";
          balance = 0;
        },
      );
    };

    // get cycles balance after creating new users
    let after = await* get_cycles();

    // return cycle difference
    (before, after)

  };

  // factor out get_cycles as an async* func in top level
  // test all 5 data structures systematically
  // test write amounts for 10, 100, 1000, 10_000
  public func write_test() : async (Nat, Nat, Nat, Nat) {
    (
      await test_array(10),
      await test_array(100),
      await test_array(1000),
      await test_array(10000),
    );
  };
  // test read amounts for 10, 100, 1000, 10_000
  // test delete amounts for 10, 100, 1000, 10_000

  // produce a text report
  // Example:
  // Tested 10 writes into Hashmap: x cycles
  // Tested 100 writes into Hashmap: x cycles

};
