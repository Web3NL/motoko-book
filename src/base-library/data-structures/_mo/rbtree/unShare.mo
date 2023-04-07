// ANCHOR: a
import RBTree "mo:base/RBTree";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

let textIntTree = RBTree.RBTree<Text, Int>(Text.compare);
textIntTree.put("bitcoin", 1);
textIntTree.put("ETH", 2);

let share : RBTree.Tree<Text, Int> = textIntTree.share();

let unshare : () = textIntTree.unshare(share);

let iter : Iter.Iter<(Text, Int)> = textIntTree.entries();

let array : [(Text, Int)] = Iter.toArray(iter)
// ANCHOR_END: a
