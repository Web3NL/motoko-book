// ANCHOR: a
import RBTree "mo:base/RBTree";
import Text "mo:base/Text";

let textIntTree = RBTree.RBTree<Text, Int>(Text.compare);
textIntTree.put("bitcoin", 1);
textIntTree.put("ETH", 2);

let share : RBTree.Tree<Text, Int> = textIntTree.share();
let treeSize : Nat = RBTree.size(share)
// ANCHOR_END: a
