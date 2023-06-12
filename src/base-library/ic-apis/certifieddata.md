# Certified Data

[Recall](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) that _query_ calls do not have the same security guarantees as _update_ calls because query calls do not 'go through' consensus.

To verify the authenticity of data returned by a query call, we can use the `CertifiedData` API. This is an advanced feature that we are mentioning here for completeness, but we will not cover it in depth.

For more information visit:

- The [Official Docs](https://internetcomputer.org/how-it-works/response-certification/)
- The [Official Base library Reference](https://internetcomputer.org/docs/current/motoko/main/base/CertifiedData)

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#type-imports-and-renaming) it is defined in.

```motoko
{{#include _mo/certifiedData/certifiedData.mo:a}}
```

### On this page

[Function `set`](#certifieddataset)  
[Function `getCertificate`](#certifieddatagetcertificate)

## CertifiedData.set

```motoko
func set : (data : Blob) -> ()
```

## CertifiedData.getCertificate

```motoko
func getCertificate : () -> ?Blob
```
