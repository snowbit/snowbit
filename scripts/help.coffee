module.exports = (robot) ->
  robot.respond /help (.*)/i, (msg) ->
    src = msg.match[1]
    if src == "base64"
      msg.reply "base64 -e|-d <query> - Base64 のエンコードとデコードを行います"
    if src == ""
      msg.reply "ping|ぴん - Reply with pong"