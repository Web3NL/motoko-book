// ANCHOR: a
import RBTree "mo:base/RBTree";
import Text "mo:base/Text";

let textIntTree = RBTree.RBTree<Text, Int>(Text.compare);
textIntTree.put("bitcoin", 1);
textIntTree.put("ETH", 2);

let get : ?Int = textIntTree.get("bitcoin");
// ANCHOR_END: a