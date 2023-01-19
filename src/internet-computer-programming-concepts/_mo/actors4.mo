// ACTORS

// ANCHOR: a
type CommentActor = actor {
    deleteComment : shared () -> ();
    readComment : shared query () -> async Text;
    writeComment : shared Text -> async ();
};
// ANCHOR_END: a
