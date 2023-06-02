import type { Identity, ActorSubclass } from '@dfinity/agent';
import { AuthClient } from '@dfinity/auth-client';
import { writable, type Readable } from 'svelte/store';
import type { _SERVICE } from '../declarations/comments.did';
import { getActor } from './actor';

export interface AuthStore extends Readable<boolean> {
	signIn: () => Promise<void>;
	signOut: () => Promise<void>;
	identity: () => Promise<Identity | undefined | null>;
	actor: () => Promise<ActorSubclass<_SERVICE>>;
}

let authClient: AuthClient | undefined | null;

const init = (): AuthStore => {
	const { subscribe, set, update } = writable<boolean>(false);

	return {
		subscribe,

		signIn: () =>
			new Promise<void>(async (resolve, reject) => {
				authClient = authClient ?? (await AuthClient.create());

				const identityProvider =
					import.meta.env.MODE == 'development'
						? `http://qhbym-qaaaa-aaaaa-aaafq-cai.localhost:8080`
						: `https://identity.internetcomputer.org/`;

				await authClient?.login({
					onSuccess: () => {
						set(true);

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

			set(false);
		},

		identity: () =>
			new Promise<Identity | undefined | null>(async (resolve, _) => {
				const client: AuthClient = authClient ?? (await AuthClient.create());
				resolve(client.getIdentity());
			}),

		actor: () =>
			new Promise<ActorSubclass<_SERVICE>>(async (resolve, _) => {
				const client: AuthClient = authClient ?? (await AuthClient.create());
				resolve(getActor(client.getIdentity()));
			})
	};
};

export const authStore: AuthStore = init();
