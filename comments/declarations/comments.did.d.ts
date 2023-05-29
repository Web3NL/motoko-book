import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export type Balance = bigint;
export type CommentHash = number;
export type PostError = { 'AnonNotAllowed' : null } |
  { 'InvalidComment' : null } |
  { 'TimeRemaining' : bigint };
export type PostResult = { 'ok' : null } |
  { 'err' : PostError };
export interface QueryComment {
  'created' : bigint,
  'userId' : string,
  'comment' : string,
  'userBalance' : Balance,
}
export interface _SERVICE {
  'balance' : ActorMethod<[], [] | [[bigint, bigint, bigint]]>,
  'latestComments' : ActorMethod<[], Array<QueryComment>>,
  'likeComment' : ActorMethod<[CommentHash], [] | [null]>,
  'postComment' : ActorMethod<[string], PostResult>,
  'tokenTreasury' : ActorMethod<[], bigint>,
}
