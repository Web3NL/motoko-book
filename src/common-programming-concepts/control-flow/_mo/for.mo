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
  ("Bonnie", 1),
  ("Chris", 550),
  ("Daphne", 80)
];
var balance = 0;

label bl for ((user, price) in donations.vals()) {
  if (balance >= 600) break bl;
  if (balance < 5) continue bl;
  balance += price;
  userList #= user # ", ";
};
// ANCHOR_END: c
