import { writable, type Readable } from 'svelte/store';
import type { QueryUser } from '../declarations/comments.did';
import { authStore } from './auth.store';
import { get } from 'svelte/store';

export interface UserStore extends Readable<QueryUser | null | undefined> {
	update: () => Promise<void>;
}

const getUser = async (): Promise<QueryUser | null | undefined> => {
    const actor = get(authStore).actor;
	const queryUser = await actor.user();
	const user = queryUser.length === 0 ? null : queryUser[0];
	return user;
};

const init = async (): Promise<UserStore> => {
	const { subscribe, set } = writable<QueryUser | null | undefined>(await getUser());

	return {
		subscribe,

		update: async () => {
			set(await getUser());
		}
	};
};

export const userStore : UserStore = await init();

authStore.subscribe(async () => {
    await userStore.update();
});
