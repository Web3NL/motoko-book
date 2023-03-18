// ANCHOR: a
import Array "mo:base/Array";
let class1 = ["Alice", "Bob", "Charlie", "David"];

let class2 = ["Alice", "Bob", "Charlie", "Eve"];

func nameEqual(name1: Text, name2: Text) : Bool {
    return name1 == name2
};

let isNameEqual : Bool = Array.equal<Text>(class1, class2, nameEqual);
// ANCHOR_END: a