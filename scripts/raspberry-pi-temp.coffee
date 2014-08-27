# Description:
#   RaspberryPiの温度に関するコマンドです
#
# Commands:
#   RaspberryPi getTemp - RaspberryPiの現在の温度を返す
#
# Authors:
#   S--Minecraft
#	http://www.h4.dion.ne.jp/~unkai/js/js03.html
#
# License;
#   Copyright (c) 2014 snowbit.
#   Released under the Apache v2 license
#   https://github.com/snowbit/snowbit/blob/master/LICENSE

# exec = require("child_process").exec
# cmd = undefined
# cmd = "dir \"command\""
# command = ->
#   exec cmd,
#     timeout: 1000
#   , (error, stdout, stderr) ->
#    console.log "stdout: " + (stdout or "none")
#     console.log "stderr: " + (stderr or "none")
#     console.log "exec error: " + error  if error isnt null
#     return
# 
# command()

module.exports = (robot) ->
   robot.respond /RaspberryPi getTemp/i, (msg) ->
      msg.reply "現在のRaspberryPiの温度は" + "です。";