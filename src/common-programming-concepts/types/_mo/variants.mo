// VARIANTS

type MyVariant = {
    #Black;
    #White;
};



let myVariant : MyVariant = #Black;



type Person = {
    #Male : Nat;
    #Female : Nat;
};

let me : Person = #Male 34;

let her : Person = #Female(29);



type Os = {
    #Mac;
    #Windows : Nat;
    #Linux : Text;
};

let linux = #Linux "Ubuntu";
