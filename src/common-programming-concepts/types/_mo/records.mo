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

// {
//     name = "Bob";
//     age = 20;
// }

// {
//     name : Text;
//     age : Nat;
// }

// let bob : { name : Text; age : Nat; } = { name = "Bob"; age = 20; };