# Description:
#   Base64 encoding and decoding
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot base64 -e|-d <query> - Base64 encode or decode <string>
#
# Author:
#   jimeh
#
# License;
#   Copyright (c) 2014 GitHub Inc.
#   Released under the MIT license
#   https://github.com/snowbit/snowbit/blob/master/NOTICE

module.exports = (robot) ->
  robot.respond /base64\s(-e|-encode)\s(.*)/i, (msg) ->
    msg.reply new Buffer(msg.match[2]).toString('base64')
    console.log "Base64 encoding:" + Buffer(msg.match[2]).toString('base64')

  robot.respond /base64\s(-d|decode)\s(.*)/i, (msg) ->
    msg.reply new Buffer(msg.match[2], 'base64').toString('utf8')
    console.log "Base64 decoding:" + Buffer(msg.match[2], 'base64').toString('utf8')
