# Description:
#   気分を返します
#
# Commands:
#   気分どう？ - 今の気分を返します
#   おみくじ - おみくじを引きます
#
# Authors:
#   S--Minecraft
#   snowfox226
#
# License;
#   Copyright (c) 2014 snowbit.
#   Released under the Apache v2 license
#   https://github.com/snowbit/snowbit/blob/master/LICENSE

phrases_f = [
  "スーパーハイテンションです！"
  "今、ちょっと話しかけないでください…悲しいので。すいません"
  "ルンルンです"
  "んー…（怒）"
  "もういやです…"
  "涙出てくるぅ・・・。。。"
  "あー、いい気分ー"
]

phrases_o = [
  "大々吉"
  "大吉"
  "中吉"
  "中吉"
  "吉"
  "吉"
  "吉"
  "小吉"
  "小吉"
  "末吉"
  "末吉"
  "凶"
  "大凶"
  "大々凶"
]

module.exports = (robot) ->

  robot.hear /気分どう？/i, (msg) ->
    msg.reply msg.random phrases_f

  robot.respond /(お|御)(神|御|み)(籤|くじ)/i, (msg) ->
    phr = msg.random phrases_o
    msg.reply "私は" + phr + "でした。あなたは" + phr + "ですね。"
