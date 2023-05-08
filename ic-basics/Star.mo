import Prim "mo:⛔";
import P "mo:base/Prelude";
import Order "mo:base/Order";
import Result "mo:base/Result";

module {

  /// `Star<Ok, Err>` is the type used for returning and propagating async* behavior and errors. It
  /// is a type with the variants, `#trappable(Ok)`, representing success and containing
  /// a value produced without an awaited call, `#commited(Ok)`, representing success and containing
  /// a value produced with an awaited call,and `#err(Err)`, representing error and containing an error value.
  ///
  /// The simplest way of working with `Star`s is to pattern match on them:
  ///
  /// For example, given a function `createUser(user : User) : Star<Id, String>`
  /// where `String` is an error message we could use it like so:
  /// ```motoko no-repl
  /// switch(createUser(myUser)) {
  ///   case (#awaited(id)) { Debug.print("Created new user with id and state commited: " # id) };
  ///   case (#trappable(id)) { Debug.print("Created new user with id and state has not been commited: " # id) };
  ///   case (#err(msg)) { Debug.print("Failed to create user with the error: " # msg) };
  /// }
  /// ```
  public type Star<Ok, Err> = {
    #trappable : Ok;
    #awaited : Ok;
    #err : {
      #trappable: Err;
      #awaited: Err;
    };
  };

  // Compares two Star's for equality.
  public func equal<Ok, Err>(
    eqOk : (Ok, Ok) -> Bool,
    eqErr : (Err, Err) -> Bool,
    r1 : Star<Ok, Err>,
    r2 : Star<Ok, Err>
  ) : Bool {
    switch (r1, r2) {
      case (#trappable(ok1), #trappable(ok2)) {
        eqOk(ok1, ok2)
      };
      case (#awaited(ok1), #awaited(ok2)) {
        eqOk(ok1, ok2)
      };
      case (#err(#trappable(err1)), #err(#trappable(err2))) {
        eqErr(err1, err2)
      };
      case (#err(#awaited(err1)), #err(#awaited(err2))) {
        eqErr(err1, err2)
      };
      case _ { false }
    }
  };

  // Compares two Stars. `#ok` is larger than `#err`. This ordering is
  // arbitrary, but it lets you for example use Results as keys in ordered maps.
  public func compare<Ok, Err>(
    compareOk : (Ok, Ok) -> Order.Order,
    compareErr : (Err, Err) -> Order.Order,
    r1 : Star<Ok, Err>,
    r2 : Star<Ok, Err>
  ) : Order.Order {
    switch (r1, r2) {
      case (#trappable(ok1), #trappable(ok2)) {
        compareOk(ok1, ok2)
      };
      case (#awaited(ok1), #awaited(ok2)) {
        compareOk(ok1, ok2)
      };
      case (#err(err1), #err(err2)) {
        switch(err1, err2){
          case(#trappable(err1),#trappable(err2)){
            compareErr(err1, err2);
          };
          case(#awaited(err1),#trappable(err2)){
            compareErr(err1, err2);
          };
          case(#trappable(err1),#awaited(err2)){
            compareErr(err1, err2);
          };
          case(#awaited(err1),#awaited(err2)){
            compareErr(err1, err2);
          };
        };
        
      };
      case (#awaited(ok1), #trappable(ok2)) {
        compareOk(ok1, ok2)
      };
      case (#trappable(ok1), #awaited(ok2)) {
        compareOk(ok1, ok2)
      };
      case (#trappable(_), #err(_)) {
        #greater
      };
      case (#awaited(_), #err(_)) {
        #greater
      };
      case (#err(_), _) { #less }
    }
  };

  /// Flattens a nested Star.
  ///
  /// ```motoko
  /// import Star "mo:base/Result";
  /// assert(Star.flatten<Nat, Text>(#trappable(#trappable(10))) == #trappable(10));
  /// assert(Star.flatten<Nat, Text>(#err(#awaited("Wrong"))) == #err(#awaited("Wrong")));
  /// assert(Star.flatten<Nat, Text>(#err(#trappable("Wrong"))) == #err(#trappable("Wrong")));
  /// assert(Star.flatten<Nat, Text>(#trappable(#err(#awaited("Wrong")))) == #err(#awaited("Wrong")));
  /// assert(Star.flatten<Nat, Text>(#trappable(#err(#trappable("Wrong")))) == #err(#trappable("Wrong")));
  /// assert(Star.flatten<Nat, Text>(#awaited(#err(#awaited("Wrong")))) == #err(#awaited("Wrong")));
  /// assert(Star.flatten<Nat, Text>(#awaited(#err(#trappable("Wrong")))) == #err(#awaited("Wrong")));
  /// ```
  public func flatten<Ok, Error>(
    result : Star<Star<Ok, Error>, Error>
  ) : Star<Ok, Error> {
    switch result {
      case (#awaited(ok)) { 
        switch(ok){
          case (#awaited(ok)){
            #awaited(ok);
          };
          case (#trappable(ok)){
            #awaited(ok);
          };
          case(#err(e)){
            switch(e){
              case(#trappable(e)){
                #err(#awaited(e));
              };
              case(#awaited(e)){
                #err(#awaited(e));
              };
            }
          };
        } 
      };
      case (#trappable(ok)) { ok };
      case (#err(err)) { #err(err)};
    };
  };

  /// Maps the `Ok` type/value, leaving any `Error` type/value unchanged.
  public func mapOk<Ok1, Ok2, Error>(
    x : Star<Ok1, Error>,
    f : Ok1 -> Ok2
  ) : Star<Ok2, Error> {
    switch x {
      case (#err(e)) { #err(e) };
      case (#awaited(r)) { #awaited(f(r))};
      case (#trappable(r)) { #trappable(f(r))};
    };
  };

  /// Maps the `Err` type/value, leaving any `Ok` type/value unchanged.
  public func mapErr<Ok, Error1, Error2>(
    x : Star<Ok, Error1>,
    f : Error1 -> Error2
  ) : Star<Ok, Error2> {
    switch x {
      case (#err(e)) { 
        switch(e){
          case(#trappable(e)){
            #err(#trappable(f(e))) 
          };
          case(#awaited(e)){
            #err(#awaited(f(e)))
          }
        };
      };
      case (#awaited(r)) { #awaited(r) };
      case (#trappable(r)) { #trappable(r) }
    }
  };

  /// Create a star from an option, including an error value to handle the `null` case.
  /// ```motoko
  /// import Star "mo:base/Star";
  /// assert(Star.fromOption(?42, "err") == #trappable(42));
  /// assert(Star.fromOption(null, "err") == #err(#trappable("err")));
  /// ```
  public func fromOption<R, E>(x : ?R, err : E) : Star<R, E> {
    switch x {
      case (?x) { #trappable(x) };
      case null { #err(#trappable(err)) }
    }
  };

  /// Create an option from a star, turning all #err into `null`.
  /// ```motoko
  /// import Star "mo:base/Star";
  /// assert(Star.toOption(#trappable(42)) == ?42);
  /// assert(Star.toOption(#awaited(42)) == ?42);
  /// assert(Star.toOption(#err(#trappable("err"))) == null);
  /// assert(Star.toOption(#err(#awaited("err"))) == null);
  /// ```
  public func toOption<R, E>(r : Star<R, E>) : ?R {
    switch r {
      case (#trappable(x)) { ?x };
      case (#awaited(x)) { ?x };
      case (#err(_)) { null }
    }
  };

  /// Create a result from a star, turning all #awaited and #trappable into #ok and all #err() into #err.
  /// ```motoko
  /// import Star "mo:base/Star";
  /// assert(Star.toResult(#trappable(42)) == #ok(42));
  /// assert(Star.toResult(#awaited(42)) == #ok(42));
  /// assert(Star.toResult(#err(#trappable("err"))) == #err("err"));
  /// assert(Star.toResult(#err(#awaited("err"))) == #err("err"));
  /// ```
  public func toResult<R, E>(r : Star<R, E>) : Result.Result<R, E> {
    switch r {
      case (#trappable(x)) { #ok(x) };
      case (#awaited(x)) { #ok(x) };
      case (#err(e)) { 
        switch(e){
          case(#trappable(e)){
            #err(e);
          };
          case(#awaited(e)){
            #err(e);
          };
        };
       };
    };
  };

  /// Create a star from a result
  /// ```motoko
  /// import Star "mo:base/Star";
  /// assert(Star.fromResult(#ok(42), true) == #awaited(42));
  /// assert(Star.fromResult(#ok(42), false) == #trappable(42));
  /// assert(Star.fromOption(#err("err"), false) == #err(#trappable("err")));
  /// assert(Star.fromOption(#err("err"), true) == #err(#awaited("err")));
  /// ```
  public func fromResult<R, E>(x : Result.Result<R,E>, awaited : Bool) : Star<R, E> {
    switch (x, awaited) {
      case (#ok(x), false) { #trappable(x) };
      case (#ok(x), true) { #awaited(x) };
      case (#err(err), true) { #err(#awaited(err)) };
      case (#err(err), false) { #err(#trappable(err)) };
    }
  };

  /// Applies a function to a successful value, but discards the result. Use
  /// `iterate` if you're only interested in the side effect `f` produces.
  ///
  /// ```motoko
  /// import Star "mo:base/Star";
  /// var counter : Nat = 0;
  /// Star.iterate<Nat, Text>(#awaited(5), func (x : Nat) { counter += x });
  /// assert(counter == 5);
  /// Star.iterate<Nat, Text>(#err(#trappable("Wrong")), func (x : Nat) { counter += x });
  /// assert(counter == 5);
  /// ```
  public func iterate<Ok, Err>(res : Star<Ok, Err>, f : Ok -> ()) {
    switch res {
      case (#awaited(ok)) { f(ok) };
      case (#trappable(ok)) { f(ok) };
      case _ {}
    }
  };

  // Whether this Star is an `#ok`
  public func isOk(r : Star<Any, Any>) : Bool {
    switch r {
      case (#awaited(_)) { true };
      case (#trappable(_)) { true };
      case (#err(_)) { false }
    }
  };

  // Whether this Star is awaited and has had a state commitment
  public func isAwaited(r : Star<Any, Any>) : Bool {
    switch r {
      case (#awaited(_)) { true };
      case (#trappable(_)) { false };
      case (#err(e)) {
        switch(e){
          case(#awaited(e)) true;
          case(#trappable(e)) false;
        };
       };
    };
  };

  // Whether this Star is trappable
  public func isTrappable(r : Star<Any, Any>) : Bool {
    switch r {
      case (#awaited(_)) { false };
      case (#trappable(_)) { true };
      case (#err(e)) {
        switch(e){
          case(#awaited(e)) false;
          case(#trappable(e)) true;
        };
       };
    };
  };

  // Whether this Result is an `#err`
  public func isErr(r : Star<Any, Any>) : Bool {
    switch r {
      
      case (#err(_)) { true };
      case (_) false;
    }
  };

  /// Asserts that its argument is an `#awaited` or `#trappable` result, traps otherwise.
  public func assertOk(r : Star<Any, Any>) {
    switch (r) {
      case (#err(_)) { assert false };
      case (_) {}
    }
  };

  /// Asserts that its argument is an `#err` result, traps otherwise.
  public func assertErr(r : Star<Any, Any>) {
    switch (r) {
      case (#err(_)) {};
      case (#awaited(_)) assert false;
      case (#trappable(_)) assert false
    }
  };

  /// Asserts that its argument is an `#trappable` result, traps otherwise.
  public func assertTrappable(r : Star<Any, Any>) {
    switch (r) {
      case (#err(_)) assert false;
      case (#awaited(_)) assert false;
      case (#trappable(_)) {};
    }
  };

  /// Asserts that its argument is an `#err` result, traps otherwise.
  public func assertAwaited(r : Star<Any, Any>) {
    switch (r) {
      case (#err(_)) assert false;
      case (#awaited(_)) {};
      case (#trappable(_)) assert false;
    }
  };

}