export const idlFactory = ({ IDL }) => {
  const Balance = IDL.Nat;
  const QueryComment = IDL.Record({
    'created' : IDL.Int,
    'userId' : IDL.Text,
    'comment' : IDL.Text,
    'userBalance' : Balance,
  });
  const CommentHash = IDL.Nat32;
  const PostError = IDL.Variant({
    'AnonNotAllowed' : IDL.Null,
    'InvalidComment' : IDL.Null,
    'TimeRemaining' : IDL.Int,
  });
  const PostResult = IDL.Variant({ 'ok' : IDL.Null, 'err' : PostError });
  return IDL.Service({
    'latestComments' : IDL.Func([], [IDL.Vec(QueryComment)], ['query']),
    'likeComment' : IDL.Func([CommentHash], [IDL.Opt(IDL.Null)], []),
    'postComment' : IDL.Func([IDL.Text], [PostResult], []),
    'tokenTreasury' : IDL.Func([], [IDL.Nat], ['query']),
    'user' : IDL.Func(
        [],
        [IDL.Opt(IDL.Tuple(IDL.Nat, IDL.Nat, IDL.Int))],
        ['query'],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
