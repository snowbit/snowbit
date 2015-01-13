# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   ping - pongと返します
#
# Authors:
#   S--Minecraft
#   snvx
#
# License;
#   Copyright (c) 2015 snowbit.
#   Released under the Apache v2 license
#   https://github.com/snowbit/snowbit/blob/master/LICENSE

module.exports = (robot) ->
  robot.respond /PING/i, (msg) ->
    msg.reply "PONG\n\n[#{new Date()}]"
