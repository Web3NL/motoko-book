# ICP Ledger

## Import

We import the ICP ledger canister by importing the interface file and declaring an actor by principle `ryjl3-tyaaa-aaaaa-aaaba-cai` and type it as the `Self` type (which is declared in the interface).

```motoko
{{#include _mo/ic-management/icp-ledger-import.mo}}
```

We can now reference the icp ledger canister as `icp`.