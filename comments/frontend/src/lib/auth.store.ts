import type { Identity, ActorSubclass } from '@dfinity/agent';
import { AuthClient } from '@dfinity/auth-client';
import { writable, type Readable } from 'svelte/store';
import type { _SERVICE } from '../declarations/comments.did';
import { getActor } from './actor';

export interface AuthStoreData {
	isAuthenticated: boolean;
	identity: Identity | undefined | null;
	actor: ActorSubclass<_SERVICE> | Promise<ActorSubclass<_SERVICE>> | undefined | null;
}

export interface AuthStore extends Readable<AuthStoreData> {
	sync: () => Promise<void>;
	signIn: () => Promise<void>;
	signOut: () => Promise<void>;
}

let authClient: AuthClient | null | undefined;

const init = async (): Promise<AuthStore> => {
	const { subscribe, set } = writable<AuthStoreData>(
		{
			isAuthenticated: false,
			identity: null,
			actor: null
		}
	);

	return {
		subscribe,

		sync: async () => {
			authClient = authClient ?? (await AuthClient.create());
			const isAuthenticated: boolean = await authClient.isAuthenticated();

			if (isAuthenticated) {
				const identity: Identity = authClient.getIdentity();

				return set({
					isAuthenticated,
					identity,
					actor: await getActor(identity)
				});
			}
			set({ isAuthenticated, identity: null, actor: null });
		},

		signIn: async () =>
			new Promise<void>(async (resolve, reject) => {
				authClient = authClient ?? (await AuthClient.create());

				const identityProvider =
					import.meta.env.MODE == 'development'
						? `http://qhbym-qaaaa-aaaaa-aaafq-cai.localhost:8080`
						: `https://identity.internetcomputer.org/`;

				await authClient?.login({
					onSuccess: async () => {
						await sync();
						resolve();
					},
					onError: reject,
					identityProvider
				});
			}),

		signOut: async () => {
			const client: AuthClient = authClient ?? (await AuthClient.create());

			await client.logout();

			// This fix a "sign in -> sign out -> sign in again" flow without window reload.
			authClient = null;

			set({isAuthenticated: false, identity: null, actor: null});
		},
	};
};

export const authStore: AuthStore = await init();

const sync = async () => await authStore.sync();
