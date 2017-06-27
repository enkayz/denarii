path = require 'path'
Robot = require("hubot/src/robot")
TextMessage = require("hubot/src/message").TextMessage
nock = require 'nock'
nockBack = require('nock').back
chai = require 'chai'
chai.use require 'chai-spies'
process.env.HUBOT_LOG_LEVEL = 'error'
{ expect, spy } = chai

describe 'hubot-coininfo', ->
  robot = null
  user = null
  adapter = null
  beforeEach (done)->
    nock.enableNetConnect()
    nockBack.setMode("wild")
    process.setMaxListeners(0)
    robot = new Robot null, 'mock-adapter', yes, 'TestHubot'
    robot.adapter.on 'connected', ->
      robot.loadFile path.resolve('.', 'src'), 'hubot-coininfo.coffee'
      hubotScripts = path.resolve 'node_modules', 'hubot', 'testbot', 'scripts'
      robot.loadFile hubotScripts, 'help.coffee'
      user = robot.brain.userForId '1', {
        name: 'testUser'
        room: '#mocha'
      }
      adapter = robot.adapter
      waitForHelp = ->
        if robot.helpCommands().length > 0
          do done
        else
          setTimeout waitForHelp, 100
      do waitForHelp
    do robot.run

  afterEach ->
    robot.server.close()
    robot.shutdown()


  describe 'help', ->
    it 'should have 12', (done)->
      expect(robot.helpCommands()).to.have.length 12
      do done

    it 'should parse help', (done)->
      adapter.on 'send', (envelope, strings)->
        try
          expect(strings[0]).to.equal """
          TestHubot allcoin COIN - Get COIN-BTC latest exchange data from Allcoin
          TestHubot bittrex COIN - Get COIN-BTC latest exchange data from Bittrex
          TestHubot bleutrade COIN - Get COIN-BTC latest exchange data from Bleutrade
          TestHubot btce CURR - Get BTC-e exchange for fiat currency (USD,RUR,EUR,GBP,CNH)
          TestHubot bter COIN - Get COIN-BTC latest exchange data from Bter
          TestHubot ccex COIN - Get COIN-BTC latest exchange data from C-Cex
          TestHubot chainz COIN getXXX - Get COIN's height, difficulty, etc
          TestHubot convert AMOUNT COIN1 COIN2 - Currency Conversion via Cryptsy
          TestHubot cryptsy COIN - Get COIN-BTC latest exchange data from Cryptsy
          TestHubot help - Displays all of the help commands that TestHubot knows about.
          TestHubot help <query> - Displays all help commands that match <query>.
          TestHubot poloniex COIN - Get COIN-BTC latest exchange data from Poloniex
          """
          do done
        catch e
          done e
      adapter.receive new TextMessage user, 'TestHubot help'

  describe 'success', ->
    [
      'testhubot convert 1 btc usd'
      'testhubot chainz mue getdifficulty'
      'testhubot btce USD'
      'testhubot allcoin doge'
      'testhubot bittrex vtc'
      'testhubot bleutrade mue'
      'testhubot bter vtc'
      'testhubot ccex doge'
      'testhubot cryptsy doge'
      'testhubot poloniex vtc'
    ].forEach (msg) ->
      describe msg, ->
        it 'should reply message', (done)->
          adapter.on 'reply', (envelope, strings)->
            try
              expect(envelope.user.id).to.equal '1'
              expect(envelope.user.name).to.equal 'testUser'
              expect(envelope.user.room).to.equal '#mocha'
              expect(strings).to.have.length(1)
              expect(strings[0]).to.have.string '[OK]'
              do done
            catch e
              done e
          adapter.receive new TextMessage user, msg
