import Text "mo:base/Text";



// ANCHOR: a
let text = "blockchain";

let encode = Text.encodeUtf8( text);

// assert encode == (vec {98; 108; 111; 99; 107; 99; 104; 97; 105; 110}) ;
// ANCHOR_END: a

// ANCHOR: b

let decode = Text.decodeUtf8(encode);


assert encode == "blockchain" ;
// ANCHOR_END: b
