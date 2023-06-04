export const idlFactory = ({ IDL }) => {
  const CommentHash = IDL.Nat32;
  const QueryComment = IDL.Record({
    'reward' : IDL.Nat,
    'created' : IDL.Int,
    'userId' : IDL.Text,
    'hash' : CommentHash,
    'comment' : IDL.Text,
  });
  const CommentHash__1 = IDL.Nat32;
  const LikeError = IDL.Variant({
    'AlreadyLiked' : IDL.Null,
    'AnonNotAllowed' : IDL.Null,
    'TimeRemaining' : IDL.Int,
  });
  const LikeResult = IDL.Variant({ 'ok' : IDL.Nat, 'err' : LikeError });
  const PostError = IDL.Variant({
    'AnonNotAllowed' : IDL.Null,
    'InvalidComment' : IDL.Null,
    'TimeRemaining' : IDL.Int,
  });
  const PostResult = IDL.Variant({ 'ok' : IDL.Null, 'err' : PostError });
  const QueryUser = IDL.Record({
    'id' : IDL.Nat,
    'balance' : IDL.Nat,
    'likes' : IDL.Vec(CommentHash),
    'lastLike' : IDL.Int,
    'lastPost' : IDL.Int,
  });
  return IDL.Service({
    'latestComments' : IDL.Func([], [IDL.Vec(QueryComment)], ['query']),
    'likeComment' : IDL.Func([CommentHash__1], [LikeResult], []),
    'postComment' : IDL.Func([IDL.Text], [PostResult], []),
    'register' : IDL.Func([], [QueryUser], []),
    'tokenTreasury' : IDL.Func([], [IDL.Nat], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
