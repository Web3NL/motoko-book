import type {
	PostResult,
	LikeResult,
	QueryComment,
	CommentHash
} from '../declarations/comments.did';
import { authStore } from './auth.store';
import { get } from 'svelte/store';

export const postComment = async (comment: string): Promise<PostResult> => {
	const actor = get(authStore).actor;
	return await actor.postComment(comment);
};

export const latestComments = async (): Promise<QueryComment[]> => {
	const actor = get(authStore).actor;
	return await actor.latestComments();
};

export const treasury = async (): Promise<bigint> => {
	const actor = get(authStore).actor;
	return await actor.tokenTreasury();
};

export const like = async (hash: CommentHash): Promise<LikeResult> => {
	const actor = get(authStore).actor;
	return await actor.likeComment(hash);
};
