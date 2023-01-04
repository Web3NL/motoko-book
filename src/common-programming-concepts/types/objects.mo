import Text "mo:base/Text";
import Bool "mo:base/Bool";
import Nat "mo:base/Nat";
//  RECORDS

// let peter = {
//     name = "Peter";
//     age = 18;
// };



let peter = {
    name : Text = "Peter";
    age : Nat = 18;
};




type Person = {
    name : Text;
    age : Nat;
};

let bob : Person = {
    name = "Bob";
    age = 20;
};

let alice : Person = {
    name = "Alice";
    age = 25;
};  



type Car = {
    brand : Text;
    var mileage : Nat;
};

let car : Car = {
    brand = "Tesla";
    var mileage = 20_000;
};

car.mileage := 30_000;

// --------------------------------------

type FootBaller = {
    country : Text;
    isGoodPlayer : Bool ;
    var goal_Yet : Nat ;
};

let Messi : FootBaller = {
     country = "Argentina";
    isGoodPlayer = true ;
    var goal_Yet = 803 ;

};

 Messi.goal_Yet := 804 ;

let ronaldo : FootBaller = {
     country = "Portugal";
    isGoodPlayer = true ;
    var goal_Yet = 803 ;

};

 ronaldo.goal_Yet := 819 ;