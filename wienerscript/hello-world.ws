FIX OIDA express = require("express");
FIX OIDA app = express();


HACKL AMOI WOS getHelloWorld() {
    OIDA response = {
        "hello": "world"
    }
    DRAH DI HAM response
}

HACKL AMOI WOS main() {
    app.listen(80, () => {
        I MAN JA NUR ("Server running on port 80");
    });

    app.get("/hello-world", (req, res, next) => {
        res.json(
            getHelloWorld()
        );
    });
}

main()