// ANCHOR: a
import RBTree "mo:base/RBTree";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

let textIntTree = RBTree.RBTree<Text, Int>(Text.compare);
textIntTree.put("bitcoin", 1);
textIntTree.put("ETH", 2);
textIntTree.put("ICP", 3);

let entries : Iter.Iter<(Text, Int)> = textIntTree.entries();

let array : [(Text, Int)]= Iter.toArray(entries)
// ANCHOR_END: a