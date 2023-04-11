// FOR
let iterator = [].vals();
// ANCHOR: a
for (pattern in iterator) {

};
// ANCHOR_END: a

// ANCHOR: b
let users = ["Amy", "Bonnie", "Chris"]; 
var userList = "";
for (user in users.vals()) {
   userList #= user # ", ";
};
// ANCHOR_END: b

// ANCHOR: c
let donations = [
  ("Amy", 140),
  ("Bonnie", 550),
  ("Chris", 80)
];
var balance = 0;
label bl for ((user, price) in donations.vals()) {
  if (balance > 600) break bl;
  balance += price;
  userList #= user # ", ";
};
// ANCHOR_END: c
