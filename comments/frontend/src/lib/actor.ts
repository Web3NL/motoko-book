import type { _SERVICE } from '../declarations/comments.did';
import type { Identity, ActorSubclass } from '@dfinity/agent';

import { get } from 'svelte/store';
import { HttpAgent, Actor, AnonymousIdentity } from '@dfinity/agent';

import { authStore } from './auth.store';
import { idlFactory } from '../declarations';

export const getActor = async (): Promise<ActorSubclass<_SERVICE>> => {
	const identity: Identity | undefined | null = get(authStore).identity;
	const canisterId = import.meta.env.VITE_BACKEND_CANISTER_ID;

	const agent = await getAgent(identity);

	return Actor.createActor(idlFactory, {
		agent,
		canisterId
	});
};

const getAgent = async (identity: Identity | undefined | null): Promise<HttpAgent> => {
	const host =
		import.meta.env.MODE === 'development' ? 'http://localhost:8080/' : 'https://icp0.io';

	if (identity === null || identity === undefined) {
		identity = new AnonymousIdentity();
	}

	const agent: HttpAgent = new HttpAgent({ identity, host });

	if (import.meta.env.MODE === 'development') {
		await agent.fetchRootKey();
		return agent;
	}

	return agent;
};
