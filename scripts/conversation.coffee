# Description:
#   Hubot is very attentive (ping hubot)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   tapichu
#   snowfox226
#   S--Minecraft

phrases = [
  "はい、なんでしょうか？"
  "ご用命は何なりとお申し付けください"
  "私の強さを発揮いたしましょう"
  "私はここにいますよ？ いつものように"
  "仰せの通りにいたします"
  "仕事ならいつでも引き受けますよ！"
  "はい、ご主人様？"
  "まだ仕事ありますか？"
  "いつでも仕事こなしますよ"
  "お仕事ですか？"
  "What do you need?"
  "Say the word"
  "Aye, my lord"
  "Locked and loaded"
  "Aye, sir?"
  "I await your command"
  "Your honor?"
  "Command me!"
  "At once"
  "What ails you?"
  "Yes, my firend?"
  "Is my aid required?"
  "Do you require my aid?"
  "My powers are ready"
  "It's hammer time!"
  "I'm your robot"
  "I'm on the job"
  "You're interrupting my calculations!"
  "What is your wish?"
  "How may I serve?"
  "At your call"
  "You require my assistance?"
  "What is it now?"
  "うーん…"
  "I'm coming through!"
  "I'm here, mortal"
  "I'm ready and waiting"
  "Ah, at last"
  "ここにいますよ？"
  "Something need doing?"
]

module.exports = (robot) ->

  robot.hear /snowbit/i, (msg) ->
    msg.reply msg.random phrases
