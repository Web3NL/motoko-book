import Text "mo:base/Text";



// ANCHOR: a
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let text = "blockchain";

let letter : Pattern = #char 'b';

let replace = Text.replace(text, letter, "c");

assert replace == "clockchain" ;
// ANCHOR_END: a

// ANCHOR: b
let firstName = "Virat";

let lastName = "Kohli";

let fullName = Text.concat(firstName, lastName); // "Alice Smith"

assert fullName == "Virat Kohli" ;

let fullNameAgain = firstName # " " #lastName ;

assert fullNameAgain == "Virat Kohli" ;
// ANCHOR_END: b

