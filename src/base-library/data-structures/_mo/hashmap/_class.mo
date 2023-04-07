// ANCHOR: a
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";

type HashMap<K, V> = HashMap.HashMap<K, V>;

let hashmap : HashMap<Text, Int> = HashMap.HashMap<Text, Int>(5, Text.equal, Text.hash);
// ANCHOR_END: a
