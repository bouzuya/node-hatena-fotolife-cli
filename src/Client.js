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

function formatEntry(e) {
  var title = e.title._;
  var u = e.link.filter(function(l) {
    return l.$.rel === 'alternate';
  })[0].$.href;
  var urlString = e['hatena:imageurl']._;
  var url = require('url');
  var parsed = url.parse(urlString);
  parsed.host = 'img.f.hatena.ne.jp';
  parsed.search = '';
  var formatted = url.format(parsed);
  return [
    'title: ' + title,
    'url: ' + u,
    'imageurl: ' + formatted
  ].join('\n');
}

exports.showListResponse = function (response) {
  return response.feed.entry.map(formatEntry).join('\n');
};

exports.showResponse = function (response) {
  return formatEntry(response.entry);
};
