# Description:
#   気分を返します
#
# Commands:
#   気分どう？ - 今の気分を返します
#   おみくじ - おみくじを引きます
#   私は誰だ？ - ユーザー名を返します
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

phrases_o1 = [
  "大々吉でした！！！"
  "大吉でした！"
  "中吉でした。"
  "中吉でした。"
  "吉でした。"
  "吉でした。"
  "吉でした。"
  "小吉でした。"
  "小吉でした。"
  "末吉でした↓"
  "末吉でした↓"
  "凶でした…"
  "大凶でした……"
  "大々凶でした(泣)"
]
phrases_o2 = [
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

  robot.respond /気分どう？/i, (msg) ->
    msg.reply msg.random phrases_f

  robot.respond /(お|御)(神|御|み)(籤|くじ)/i, (msg) ->
    phr1 = msg.random phrases_o1
    phr2 = msg.random phrases_o2
    msg.reply "私は" + phr1 + "あなたは" + phr2 + "ですね。"

  robot.respond /(私|僕|自分|俺|あたい|うち|おれ|わたし|ぼく|じぶん)は(誰|だれ)(だ|かな|でしょう|だろう|ですか)?(？|\?|。)?/i, (msg) ->
    msg.reply "あなたは#{msg.message.user.name}です"

