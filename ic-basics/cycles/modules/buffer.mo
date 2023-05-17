import cyc "../cycles";

type User = cyc.User;

module {
// cycle test in Buffer data structure //////////////////////////////////////////////////

  let natstorage = Buffer.Buffer<User>(10000);

  public func buffer_size() : async Nat {
    natstorage.size();
  };

   public func test_Buffer(n : Nat) : async* (Nat, Nat) {

    // get cycles balance before creating new users
    let before = await* get_cycles();

    for (i in Iter.range(0, n -1)) {
      natstorage.put(
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