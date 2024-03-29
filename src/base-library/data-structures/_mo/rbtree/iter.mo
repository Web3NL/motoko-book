// ANCHOR: a
import RBTree "mo:base/RBTree";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

let textIntTree = RBTree.RBTree<Text, Int>(Text.compare);
textIntTree.put("bitcoin", 1);
textIntTree.put("ETH", 2);
textIntTree.put("ICP", 3);

let share : RBTree.Tree<Text, Int> = textIntTree.share();

let iter : Iter.Iter<(Text, Int)> = RBTree.iter<Text, Int>(share, #bwd);

let array : [(Text, Int)] = Iter.toArray(iter)
// ANCHOR_END: a
