let solr = require("solr-node");

let client = new solr({
    "host": "34.73.204.225",
    "port": "34319",
    "core": "blog_data",
    "protocol": "http"
});

module.exports = client; 