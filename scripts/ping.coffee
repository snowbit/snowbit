# Description:
#   ping-pong
#
# Commands:
#   ping - return pong
#
# Authors:
#   S--Minecraft
#   ayatk

module.exports = (robot) ->
  robot.respond /PING/i, (msg) ->
    msg.reply "PONG\n\n#{new Date()}"
