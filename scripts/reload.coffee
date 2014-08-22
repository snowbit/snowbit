# Description:
#   Allows Hubot to (re)load scripts without restart
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot command count - Tells how many commands hubot knows
#
# Author:
#   spajus

Fs       = require 'fs'
Path     = require 'path'

oldCommands = null
oldListeners = null

module.exports = (robot) ->

  robot.respond /command count/i, (msg) ->
    msg.send "#{msg.robot.commands.length} のコマンドを適用中です"

  robot.respond /reload -s/i, (msg) ->
    try
      oldCommands = robot.commands
      oldListeners = robot.listeners

      robot.commands = []
      robot.listeners = []

      reloadAllScripts msg, success, (err) ->
        msg.send err
    catch error
      console.log "Hubot reloader:", error
      msg.send "スクリプト読み込み時にエラーが発生しました: #{error}"

success = (msg) ->
  # Cleanup old listeners and help
  for listener in oldListeners
    listener = {}
  oldListeners = null
  oldCommands = null
  msg.send "全てのスクリプトをリロードしました"

reloadAllScripts = (msg, success, error) ->
  robot = msg.robot
  robot.emit('reload_scripts')
  scriptsPath = Path.resolve ".", "scripts"
  robot.load scriptsPath

  scriptsPath = Path.resolve ".", "src", "scripts"
  robot.load scriptsPath

  hubotScripts = Path.resolve ".", "hubot-scripts.json"
  Fs.exists hubotScripts, (exists) ->
    if exists
      Fs.readFile hubotScripts, (err, data) ->
        if data.length > 0
          try
            scripts = JSON.parse data
            scriptsPath = Path.resolve "node_modules", "hubot-scripts", "src", "scripts"
            robot.loadHubotScripts scriptsPath, scripts
          catch err
            error "Error parsing JSON data from hubot-scripts.json: #{err}"
            return

  externalScripts = Path.resolve ".", "external-scripts.json"
  Fs.exists externalScripts, (exists) ->
    if exists
      Fs.readFile externalScripts, (err, data) ->
        if data.length > 0
          try
            scripts = JSON.parse data
          catch err
            error "Error parsing JSON data from external-scripts.json: #{err}"
          robot.loadExternalScripts scripts
          return
  success(msg)

