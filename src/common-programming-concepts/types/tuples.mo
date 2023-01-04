import Text "mo:base/Text";
import Nat "mo:base/Nat";
// TUPLES

type MyTuple = (Nat, Text);



let myTuple: MyTuple = (2, "motoko");



let motoko = myTuple.1;



let profile : (Text, Nat, Bool) = ("Anon", 100, true);



let username: Text = profile.0;

// ------------------------------------------------------------

type FootBaller = (Text, Bool, Nat) ;

let messi : FootBaller = ("Argentina", true, 804 ) ;

let goal_of_messi = messi.2 ;

let ronaldo : (Text, Bool, Nat) = ("Portugal", true, 819 ) ;