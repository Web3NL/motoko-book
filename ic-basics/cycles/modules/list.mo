import cyc "../cycles";


type User = cyc.User;

module {
// cycle test in List data structure //////////////////////////////////////////////////////

  type List<T> = ?(T, List<T>);

  let myList : ?(User, List<User>) = List.nil();

  public func isNil() : async Bool {
    List.isNil(myList);
  };

  public func list_size() : async Nat {
    List.size(myList);
  };

  public  func test_list(n : Nat) : async* (Nat, Nat) {

    // get cycles balance before creating new users
    let before = await* get_cycles();

    var array : [var User] = Array.init<User>(
      n,
      {
        principal = P.fromActor(Cycles);
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

  
  


}