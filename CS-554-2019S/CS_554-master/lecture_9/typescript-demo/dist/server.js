"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const app_1 = require("./app");
const port = 4041;
app_1.default.listen(port, function () {
    console.log('Express server listening on port ' + port);
});
