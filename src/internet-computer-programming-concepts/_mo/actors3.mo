// ACTORS

// ANCHOR: a
actor {

    private var latestComment = "";

    public shared query func readComment() : async Text {
        latestComment;
    };

    public shared func writeComment(comment : Text) : async () {
        latestComment := comment;
    };

    public shared func deleteComment() {
        latestComment := "";
    };

};
// ANCHOR_END: a
