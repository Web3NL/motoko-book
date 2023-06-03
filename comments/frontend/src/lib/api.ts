import type { PostResult, QueryComment, QueryUser } from '../declarations/comments.did';
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

export const user = async (): Promise<[] | [QueryUser]> => {
	const actor = get(authStore).actor;
	return await actor.user();
};
