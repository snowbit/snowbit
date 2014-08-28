# Description:
#   RaspberryPiの温度に関するコマンドです
#
# Commands:
#   RaspberryPi getTemp - RaspberryPiの現在の温度を返す
#
# Authors:
#   S--Minecraft
#	http://www.h4.dion.ne.jp/~unkai/js/js03.html
#
# License;
#   Copyright (c) 2014 snowbit.
#   Released under the Apache v2 license
#   https://github.com/snowbit/snowbit/blob/master/LICENSE

child_process = require 'child_process'

module.exports = (robot) ->
   robot.respond /RaspberryPi getTemp/i, (msg) ->
      child_process.exec 'cat /sys/class/thermal/thermal_zone0/temp', (error, stdout, stderr) ->
         if error
            msg.reply "取得失敗: " + stderr
         else
            temp = stdout+''
            temp = temp/1000
            
            msg.reply "現在のRaspberryPiの温度は" + temp + "です。"
