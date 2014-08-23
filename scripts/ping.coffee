# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   ping - Reply with pong
#   ピン - ポン
#   エコー|まね <text> - Reply back with <text>
#   現在時刻|今何時？ - Reply with current time
#   exit - End hubot process
#   ごちうさ|こころぴょんぴょん - あぁ＾～心がぴょんぴょんするんじゃぁ＾～
#   snowfox226|ゆきさん|ゆきぎつね - ゆきさんはかわゆいんじゃぁ＾～（絶対）
#
# Authors:
#   S--Minecraft
#   snowfox226
#
# License;
#   Copyright (c) 2014 snowbit.
#   Released under the Apache v2 license
#   https://github.com/snowbit/snowbit/blob/master/LICENSE

module.exports = (robot) ->
  robot.respond /PING/i, (msg) ->
    msg.reply "PONG"

  robot.respond /ピン/i, (msg) ->
    msg.reply "ポン"

  robot.respond /アダプター/i, (msg) ->
    msg.reply robot.adapterName

  robot.respond /(エコー|まね)( |　)(.*)/i, (msg) ->
    msg.reply msg.match[3]

  robot.respond /(現在時刻|(いま|今)何時？)/i, (msg) ->
    msg.reply "現在の時刻は #{new Date()}です。"

  robot.on "followed", (event) ->
    robot.logger.info "followed #{event.user.name}!"
    robot.adapter.join event.user

  robot.respond /Join/i, (msg) ->
    robot.adapter.join msg.message.user
    msg.reply "Joined #{msg.message.user.name}"

  robot.respond /ごちうさ|こころぴょんぴょん/i, (msg) ->
    msg.reply "あぁ＾～心がぴょんぴょんするんじゃぁ＾～"

  robot.respond /snowfox226|ゆきさん|ゆきぎつね/i, (msg) ->
    msg.reply "ゆきさんはかわゆいんじゃぁ＾～（絶対）"

  robot.respond /test/i, (msg) ->
    msg.reply robot.user.stream()

# robot.respond /exit/i, (msg) ->
#   msg.send "終了します"
#   setTimeout ->
#     process.exit 0
#   , 1000
