# Description:
#   Allows hubot to update itself using git pull and npm update.
#   If updates are downloaded you'll need to restart hubot, for example using "hubot die" (restart using a watcher like forever.js).
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot update - Performs a git pull and npm udate.
#   hubot pending update - Informs if there are pending updates (hubot needs a restart)
#
# Author:
#   benjamine

child_process = require 'child_process'
downloaded_updates = false

module.exports = (robot) ->
  robot.respond /pending updates?\??$/i, (msg) ->
    if downloaded_updates
      msg.reply "I have some pending updates, KILL ME PLEASE! (hint: hubot die)"
    else
      msg.reply "I'm up-to-date!"

  robot.respond /update( yourself)?$/i, (msg) ->
    changes = false
    try
  msg.reply "git pull..."
  child_process.exec 'git pull', (error, stdout, stderr) ->
    if error
      msg.reply "git pull failed: " + stderr
    else
      output = stdout+''
      if not /Already up\-to\-date/.test output
        msg.reply "my source code changed:\n" + output
        changes = true
      else
        msg.reply "my source code is up-to-date"
    try
      msg.send "npm update..."
      child_process.exec 'npm update', (error, stdout, stderr) ->
        if error
          msg.reply "npm update failed: " + stderr
        else
          output = stdout+''
          if /node_modules/.test output
            msg.reply "some dependencies updated:\n" + output
            changes = true
          else
            msg.reply "all dependencies are up-to-date"
        if changes
          downloaded_updates = true
          msg.reply "I downloaded some updates, KILL ME PLEASE! (hint: hubot die)"
        else
          if downloaded_updates
            msg.reply "I have some pending updates, KILL ME PLEASE! (hint: hubot die)"
          else
            msg.reply "I'm up-to-date!"
    catch error
      msg.reply "npm update failed: " + error
    catch error
      msg.reply "git pull failed: " + error
