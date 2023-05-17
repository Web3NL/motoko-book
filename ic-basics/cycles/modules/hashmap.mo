import HashMap "mo:base/HashMap";
import cyc "../cycles";


type User = cyc.User;
module {
// cycle test in hashmap data structure //////////////////////////////////////////////////

let myMap = HashMap.HashMap<Nat, User>(1000, Nat.equal, func x = Nat32.fromNat(x));

  public func hashmap_size() : async Nat {
    myMap.size();
  };

   public func test_hashmap(n : Nat) : async* (Nat, Nat) {

    // get cycles balance before creating new users
    let before = await* get_cycles();

    for (i in Iter.range(1, n)) {
      myMap.put(
        i,
        {
          principal = P.fromActor(Cycles);
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


}
