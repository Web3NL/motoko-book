// ANCHOR: a
import Text "mo:base/Text";
import Order "mo:base/Order";
import Char "mo:base/Char";

let text1 : Text = "icp";
let text2 : Text = "ICP";

func compare(c1 : Char,c2 : Char) : Order.Order {
    Char.compare(c1, c2) 
};

Text.compareWith(text1, text2, compare);
// ANCHOR_END: a
