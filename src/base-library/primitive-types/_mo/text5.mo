import Text "mo:base/Text";
// ANCHOR: a
type Pattern = {
    #char : Char;
    #text : Text;
    #predicate : (Char -> Bool);
};
// ANCHOR_END: a
