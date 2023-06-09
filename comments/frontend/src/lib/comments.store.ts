import { writable, type Readable } from 'svelte/store';
import type { QueryComment } from '$declarations/commentsbackend.did';
import { latestComments } from './api';

export interface CommentsStore extends Readable<QueryComment[]> {
	update: () => Promise<void>;
}

const init = async (): Promise<CommentsStore> => {
	const comments = await latestComments();

	const { subscribe, set } = writable<QueryComment[]>(comments);

	return {
		subscribe,

		update: async () => {
			set(await latestComments());
		}
	};
};

export const commentsStore: CommentsStore = await init();
