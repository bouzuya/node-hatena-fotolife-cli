# hatena-fotolife-cli

[Hatena::Fotolife][fotolife] command life interface (unofficial).

![](http://img.f.hatena.ne.jp/images/fotolife/b/bouzuya/20140818/20140818234149.gif)

## Installation

    $ npm install -g hatena-fotolife-cli

## Example

    $ # show usage
    $ hatena-fotolife --help

    $ # configure
    $ export HATENA_ID='username'
    $ export HATENA_API_KEY='apikey'

    $ # upload a photo
    $ hatena-fotolife upload --title 'special bouzuya icon' ./bouzuya.png
    title: special bouzuya icon
    url: http://f.hatena.ne.jp/bouzuya/20140818181135

    $ # list photos
    $ hatena-fotolife list
    title: 2014-08-17
    url: http://f.hatena.ne.jp/bouzuya/20140817170105
    title: bouzuya icon
    url: http://f.hatena.ne.jp/bouzuya/20110326224118

    $ # show a photo info
    $ hatena-fotolife info 20140818181135
    title: special bouzuya icon
    url: http://f.hatena.ne.jp/bouzuya/20140818181135

    $ # update a photo
    $ hatena-fotolife update --title 'icon' 20140818181135

    $ # delete a photo
    $ hatena-fotolife delete 20140818181135

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]

[fotolife]: http://f.hatena.ne.jp/
[travis]: https://travis-ci.org/bouzuya/node-hatena-fotolife-cli
[travis-badge]: https://travis-ci.org/bouzuya/node-hatena-fotolife-cli.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/node-hatena-fotolife-cli
[david-dm-badge]: https://david-dm.org/bouzuya/node-hatena-fotolife-cli.png
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
