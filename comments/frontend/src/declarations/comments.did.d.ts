import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export type CommentHash = number;
export type CommentHash__1 = number;
export type LikeError = { 'AlreadyLiked' : null } |
  { 'AnonNotAllowed' : null } |
  { 'TimeRemaining' : bigint };
export type LikeResult = { 'ok' : bigint } |
  { 'err' : LikeError };
export type PostError = { 'AnonNotAllowed' : null } |
  { 'InvalidComment' : null } |
  { 'TimeRemaining' : bigint };
export type PostResult = { 'ok' : null } |
  { 'err' : PostError };
export interface QueryComment {
  'reward' : bigint,
  'created' : bigint,
  'userId' : string,
  'hash' : CommentHash,
  'comment' : string,
}
export interface QueryUser {
  'id' : bigint,
  'balance' : bigint,
  'likes' : Uint32Array | number[],
  'lastLike' : bigint,
  'lastPost' : bigint,
}
export interface _SERVICE {
  'latestComments' : ActorMethod<[], Array<QueryComment>>,
  'likeComment' : ActorMethod<[CommentHash__1], LikeResult>,
  'postComment' : ActorMethod<[string], PostResult>,
  'register' : ActorMethod<[], QueryUser>,
  'tokenTreasury' : ActorMethod<[], bigint>,
}
