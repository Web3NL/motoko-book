import type { PostResult, QueryComment, User } from '../declarations/comments.did';
import { authStore } from './auth.store';
import { get } from 'svelte/store';

const actor = get(authStore).actor;

export const postComment = async (comment: string): Promise<PostResult> => {
	return await actor.postComment(comment);
};

export const latestComments = async (): Promise<QueryComment[]> => {
	return await actor.latestComments();
};

export const user = async (): Promise<[] | [User]> => {
	return await actor.user();
};
