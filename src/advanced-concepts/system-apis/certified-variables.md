# Certified Variables

[Recall](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) that _query_ calls do not have the same security guarantees as _update_ calls because query calls do not 'go through' consensus.

To verify the authenticity of data returned by a query call, we can use the `CertifiedData` API. This is an advanced feature that we are mentioning here for completeness, but we will not cover it in depth.

For more information visit:

- The [Base Library Page](/base-library/ic-apis/certifieddata.html) of this book
- The [Official Docs](https://internetcomputer.org/how-it-works/response-certification/)
- The [Official Base library Reference](https://internetcomputer.org/docs/current/motoko/main/base/CertifiedData)
