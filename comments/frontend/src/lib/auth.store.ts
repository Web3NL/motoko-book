import type { Identity, ActorSubclass } from '@dfinity/agent';
import { AnonymousIdentity } from '@dfinity/agent';
import { AuthClient } from '@dfinity/auth-client';
import { writable, type Readable } from 'svelte/store';
import type { _SERVICE } from '../declarations/comments.did';
import { getActor } from './actor';

export interface AuthStoreData {
	isAuthenticated: boolean;
	identity: Identity;
	actor: ActorSubclass<_SERVICE>;
}

export interface AuthStore extends Readable<AuthStoreData> {
	sync: () => Promise<void>;
	signIn: () => Promise<void>;
	signOut: () => Promise<void>;
}

let authClient: AuthClient | null | undefined;

const anonIdentity = new AnonymousIdentity();
const anonActor: ActorSubclass<_SERVICE> = await getActor(new AnonymousIdentity());

const init = async (): Promise<AuthStore> => {
	const { subscribe, set } = writable<AuthStoreData>({
		isAuthenticated: false,
		identity: new AnonymousIdentity(),
		actor: anonActor
	});

	return {
		subscribe,

		sync: async () => {
			authClient = authClient ?? (await AuthClient.create());
			const isAuthenticated: boolean = await authClient.isAuthenticated();

			if (isAuthenticated) {
				const signIdentity: Identity = authClient.getIdentity();

				const authActor = await getActor(signIdentity);

				return set({
					isAuthenticated,
					identity: signIdentity,
					actor: authActor
				});
			}
			set({ isAuthenticated, identity: anonIdentity, actor: anonActor });
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

			set({ isAuthenticated: false, identity: anonIdentity, actor: anonActor });
		}
	};
};

export const authStore: AuthStore = await init();

const sync = async () => await authStore.sync();
