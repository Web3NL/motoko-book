
import PT "../publicType";
import RB "mo:base/RBTree";
import Nat "mo:base/Nat";
import P "mo:base/Principal";
import Iter "mo:base/Iter";


module {
    type User = PT.User;

  let tree = RB.RBTree<Nat, User>(Nat.campare()) ;

  public query func getUser(i : Nat) : async ?User { tree.get(i) };

  public query func size() : async Nat { RB.size(tree.share()) };

   func newUser(i : Nat, user : User) { tree.put(i, user) };

  // let mc : MC = actor ("aaaaa-aa");

  // test cycle cost for n new users
    func test(n : Nat) : async* Nat {

    for (i in Iter.range(1, n)) {
      newUser(
        i,
        {
          principal = P.fromText("n5jpq-syaaa-aaaal-qbywq-cai");
          username = "name";
          balance = 0;
        },
      );
    };

  };

};
