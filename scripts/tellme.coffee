# Description:
#   教えてくれます
#
# Commands:
#   tellme もふもふ度の計算式 - もふもふ度の計算式を返す
#   tellme math (展開|因数分解)の公式 - 展開・因数分解の公式を返す
#   tellme math 二次方程式の公式 - 二次方程式の公式を返す
#   tellme math (ピタゴラス|三平方)の定理 - ピタゴラスの定理を返す
#
# Authors:
#   S--Minecraft

class space
  RandomSpace: ->
    str = "　";
    (str[Math.floor(Math.random() * str.length)] for index in [1..20]).join ""

module.exports = (robot) ->
  robot.respond /tellme( |　)もふもふ(度|ど)の(計算式|式|しき|けいさんしき)/i, (msg) ->
    msg.reply "もふもふ度の計算式は「もふもふ度=もふもふ定数×摩擦度×1cm押して反発するまでの秒数×反発係数」です。"
    if console.error()
      msg.reply "もふもふ度の計算式は「もふもふ度=もふもふ定数×摩擦度×1cm押して反発するまでの秒数×反発係数」です。" + space.RandomSpace

  robot.respond /tellme( |　)math( |　)(展開|てんかい|因数分解|いんすうぶんかい|展開・因数分解|てんかい・いんすうぶんかい)の(公式|こうしき)/i, (msg) ->
      msg.reply "展開・因数分解の公式は「m(a+b)=ma+mb,(a+b)^2=a^2+2ab+b^2,(a-b)^2=a^2-2ab+b^2,(a+b)(a-b)=a^2-b^2」です。(中学範囲、高校範囲は[展開の公式2])"
      if console.error()
        msg.reply "展開・因数分解の公式は「m(a+b)=ma+mb,(a+b)^2=a^2+2ab+b^2,(a-b)^2=a^2-2ab+b^2,(a+b)(a-b)=a^2-b^2」です。(中学範囲、高校範囲は[展開の公式2])" + space.RandomSpace
  robot.respond /tellme( |　)math( |　)(展開|てんかい|因数分解|いんすうぶんかい|展開・因数分解|てんかい・いんすうぶんかい)の(公式|こうしき)2/i, (msg) ->
      msg.reply "展開・因数分解の公式は「(a+b)(a^2-ab+b^2)=a^3+b^3,(a-b)(a^2+ab+b^2)=a^3-b^3,a^3+3a^2b+3ab^3+b^3=(a+b)^3」です。(高校範囲、中学範囲は[展開の公式])"
      if console.error()
        msg.reply "(a+b)(a^2-ab+b^2)=a^3+b^3,(a-b)(a^2+ab+b^2)=a^3-b^3,a^3+3a^2b+3ab^3+b^3=(a+b)^3」です。(高校範囲、中学範囲は[展開の公式])" + space.RandomSpace
  robot.respond /tellme( |　)math( |　)(二次|にじ)(方程式|ほうていしき)の(公式|こうしき)/i, (msg) ->
      msg.reply "二次方程式の公式は「ax^2+bx+c=0」のとき、「x={-b+-√(b^2-4ac)}/2a)」です。"
      if console.error()
        msg.reply "二次方程式の公式は「ax^2+bx+c=0」のとき、「x={-b+-√(b^2-4ac)}/2a)」です。" + space.RandomSpace
  robot.respond /tellme( |　)math( |　)(三平方|ピタゴラス|さんへいほう)の(定理|ていり)/i, (msg) ->
      msg.reply "ピタゴラスの定理はcを斜辺としたとき、「c^2=a^2+b^2)」です。"
      if console.error()
        msg.reply "二次方程式の公式は「ax^2+bx+c=0」のとき、「x={-b+-√(b^2-4ac)}/2a)」です。" + space.RandomSpace
