// ANCHOR: a
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";

let map = HashMap.HashMap<Text, Int>(5, Text.equal, Text.hash);

  map.put("sachin", 100);
  map.put("kohli", 74);
  map.put("root", 50);

   func mapping() : async ?Int {

    func edit(k : Text, v : Int) : Int {
      v * 2;
    };

    let mapping : HashMap.HashMap<Text, Int> = HashMap.map<Text, Int, Int>(
      map,
      Text.equal,
      Text.hash,
      edit,
    );
    mapping.get("kohli")
   }
// ANCHOR_END: a