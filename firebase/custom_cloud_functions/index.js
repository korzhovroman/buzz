const admin = require("firebase-admin/app");
admin.initializeApp();

const fileProxy = require("./file_proxy.js");
exports.fileProxy = fileProxy.fileProxy;
