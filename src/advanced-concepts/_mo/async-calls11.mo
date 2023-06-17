import Result "mo:base/Result";
import Error "mo:base/Error";

actor {
    type Result = Result.Result<(), (Error.ErrorCode, Text)>;

    var state = 0;

    // should return `async ()`, but in some cases throws an Error
    private func error() : async* () {
        state += 1;
        if (state < 10) throw Error.reject("intentional error");
    };

    public func test_error() : async Result {
        // try to `await*` or catch any error or trap
        let result : Result = try {
            await* error();

            #ok();
        } catch (e) {
            let code = Error.code(e);
            let message = Error.message(e);

            #err(code, message);
        };

        result
    };
};
