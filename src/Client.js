exports.construct = function (params) {
  return function () {
    return new (require('hatena-fotolife-api').Fotolife)(params);
  };
};

exports.callMethod = function (method) {
  return function (obj) {
    return function (params) {
      return function () {
        return obj[method](params);
      };
    };
  };
};
