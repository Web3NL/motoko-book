import type { Identity } from '@dfinity/agent';
import { AuthClient } from '@dfinity/auth-client';
import { derived, writable, type Readable } from 'svelte/store';

export interface AuthStoreData {
	identity: Identity | undefined | null;
}

let authClient: AuthClient | undefined | null;

export interface AuthStore extends Readable<AuthStoreData> {
	sync: () => Promise<void>;
	signIn: () => Promise<void>;
	signOut: () => Promise<void>;
}

const initAuthStore = (): AuthStore => {
	const { subscribe, set, update } = writable<AuthStoreData>({
		identity: undefined
	});

	return {
		subscribe,

		sync: async () => {
			authClient = authClient ?? (await AuthClient.create());
            
			const isAuthenticated: boolean = await authClient.isAuthenticated();

			set({
				identity: isAuthenticated ? authClient.getIdentity() : null
			});
		},

		signIn: () =>
			// eslint-disable-next-line no-async-promise-executor
			new Promise<void>(async (resolve, reject) => {
				authClient = authClient ?? (await AuthClient.create());

				const identityProvider = import.meta.env.MODE == 'development'
					? `http://qhbym-qaaaa-aaaaa-aaafq-cai.localhost:8080`
					: `https://identity.ic0.app`;

				await authClient?.login({
					onSuccess: () => {
						update((state: AuthStoreData) => ({
							...state,
							identity: authClient?.getIdentity()
						}));

						resolve();
					},
					onError: reject,
					identityProvider,
				});
			}),

		signOut: async () => {
			const client: AuthClient = authClient ?? (await AuthClient.create());

			await client.logout();

			// This fix a "sign in -> sign out -> sign in again" flow without window reload.
			authClient = null;

			update((state: AuthStoreData) => ({
				...state,
				identity: null
			}));
		}
	};
};

export const authStore = initAuthStore();

export const authSignedInStore: Readable<boolean> = derived(
	authStore,
	({ identity }) => identity !== null && identity !== undefined
);