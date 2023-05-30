import { HttpAgent, Actor } from '@dfinity/agent';
import type { Identity } from '@dfinity/agent';
import { idlFactory } from '../../../declarations';
import type { _SERVICE } from '../../../declarations/comments.did.js';
import { authStore } from './auth.store';
import { get } from 'svelte/store';

export const canisterId = import.meta.env.VITE_BACKEND_CANISTER_ID;

const id : Identity = get(authStore).identity | undefined;
const agent = new HttpAgent({id});

