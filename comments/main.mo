// Example Actor for the Motoko Programming Language Book 
// for demonstration purposes only.
// Tokens are not transferable.

import Time "mo:base/Time";
import Int "mo:base/Int";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

import Types "Types";
// import Utils "Utils";

actor {
    type Comment = Types.Comment;

    type UserIds = Types.UserIds;
    type Balances = Types.Balances;

    type Reward = Types.Reward;
    type CommentStore = Types.CommentStore;

    let userIds : UserIds = HashMap.HashMap<Principal, Nat>(100, Principal.equal, Principal.hash);
    let balances : Balances = HashMap.HashMap<Principal, Nat>(100, Principal.equal, Principal.hash);

    let commentStore : CommentStore = HashMap.HashMap<Int, (Comment, Reward)>(100, Int.equal, Int.hash);
}