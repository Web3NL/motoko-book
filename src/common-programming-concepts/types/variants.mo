
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

// --------------------------------------------------------------------

type MaxGoalIn2023 = {
    #messi : Nat ;
    #ronaldo : Nat ;
    #Mbappe : Nat

}
;
let maxGoalIn2023 : MaxGoalIn2023 = #Mbappe 50 ;


type MaxGoalIn2022<A, B, C> = {
    #messi : A ;
    #ronaldo : B ;
    #Mbappe : C ;

};

let whyNotRonaldo : MaxGoalIn2022<Nat, Text, Nat> = #ronaldo "May be because he is now 37 years old" ;

// ---------------------------------------------------------------------------------------

type Result<A, B> = {
    #win : A ;
    #Lose : B ;
};

let  who_win_FIFA_2022  : Result<Text, Text> = #win "Argentina win " ;

let  who_Lose_FIFA_2022  : Result<Text, Text> = #Lose "France lose  " ;