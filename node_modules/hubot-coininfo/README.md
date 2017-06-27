# hubot-coininfo

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/upgradeadvice/hubot-coininfo?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

A Hubot script that pulls info from various cryptocoin apis.

## Installation

    $ npm install https://github.com/upgradeadvice/hubot-coininfo/archive/master.tar.gz

or

    $ npm install https://github.com/upgradeadvice/hubot-coininfo/archive/{VERSION}.tar.gz

## Example
```
hubot convert AMOUNT COIN1 COIN2 - Currency Conversion via Cryptsy
hubot chainz COIN getXXX - Get COIN's height, difficulty, etc
hubot btce - Get BTC-e exchange for fiat currency (USD,RUR,EUR,GBP,CNH)
hubot allcoin COIN - Get COIN-BTC latest exchange data from Allcoin
hubot bittrex COIN - Get COIN-BTC latest exchange data from Bittrex
hubot bleutrade COIN - Get COIN-BTC latest exchange data from Bleutrade
hubot bter COIN - Get COIN-BTC latest exchange data from Bter
hubot ccex COIN - Get COIN-BTC latest exchange data from C-Cex
hubot cryptsy COIN - Get COIN-BTC latest exchange data from Cryptsy
hubot poloniex COIN - Get COIN-BTC latest exchange data from Poloniex
```
## Configuration

See [`src/hubot-coininfo.coffee`](src/hubot-coininfo.coffee).

## Development

`npm run`

## License

[MIT](LICENSE)

## Author

upgradeadvice

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]
[![Coverage Status][coveralls-badge]][coveralls]

[travis]: https://travis-ci.org/upgradeadvice/hubot-coininfo
[travis-badge]: https://travis-ci.org/upgradeadvice/hubot-coininfo.svg?branch=master
[david-dm]: https://david-dm.org/upgradeadvice/hubot-coininfo
[david-dm-badge]: https://david-dm.org/upgradeadvice/hubot-coininfo.png
[coveralls]: https://coveralls.io/r/upgradeadvice/hubot-coininfo
[coveralls-badge]: https://img.shields.io/coveralls/upgradeadvice/hubot-coininfo.svg
[user]: https://github.com/upgradeadvice
