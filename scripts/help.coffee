# Description:
#   ヘルプ
#
# Commands:
#   hubot help <command> - コマンドの解説をしてくれます
#
# Authors:
#   snowfox226
#
# License;
#   Copyright (c) 2014 snowbit.
#   Released under the Apache v2 license
#   https://github.com/snowbit/snowbit/blob/master/LICENSE

module.exports = (robot) ->
  robot.respond /help (.*)/i, (msg) ->
    src = msg.match[1]
    if src == "base64"
      msg.reply "Base64 のエンコードとデコードを行います"
    else if src == "ping"
      msg.reply "pongを返します"
    else src == "temp"
      msg.reply "現在のCPU温度を返します"
