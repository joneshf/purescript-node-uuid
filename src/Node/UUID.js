'use script';

// module Node.UUID


var uuid;
try {
  require;
  uuid = require('node-uuid');
} catch (e) {
  uuid = window.uuid;
}

exports.uuid = uuid;

exports.showuuid = function (ident) {
  return ident.toString();
};

exports.v1 = function () {
  return uuid.v1();
};

exports.v4 = function () {
  return uuid.v4();
};

exports.runUUID = function (UUID) {
  return UUID();
};

parse = function (str) {
  return uuid.parse(str);
};

unparse = function (buffer) {
  return uuid.unparse(buffer);
};
