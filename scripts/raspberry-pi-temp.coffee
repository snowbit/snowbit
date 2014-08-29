# Description:
#   RaspberryPiの温度に関するコマンドです
#
# Commands:
#   RaspberryPi getTemp - RaspberryPiの現在の温度を返す
#
# Authors:
#   S--Minecraft
#
# License;
#   Copyright (c) 2014 snowbit.
#   Released under the Apache v2 license
#   https://github.com/snowbit/snowbit/blob/master/LICENSE

child_process = require 'child_process'
cronJob = require('cron').CronJob



module.exports = (robot) ->
   robot.respond /temp/i, (msg) ->
      child_process.exec 'cat /sys/class/thermal/thermal_zone0/temp', (error, stdout, stderr) ->
         if error
            msg.reply "取得失敗: " + stderr
         else
            temp = stdout+''
            temp = temp/1000
            
            msg.reply "現在のCPU温度は" + temp + "です。"
   
   # 1分間隔でuser(現在はShell)に現在時刻を出力
   # *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
   #every = '0 * * * * *'
   #cronjob = new cronJob(every,() =>
   #   user = "Shell"
   #   robot.send user, "現在は#{new Date()}です。"
   #)
   #cronjob.start()
   
   # 1分間隔でRaspberryPiの温度を取得→40℃以上なら出力→50℃以上なら停止
   every = '0 * * * * *'
   cronjob = new cronJob(every,() =>
      child_process.exec 'cat /sys/class/thermal/thermal_zone0/temp', (error, stdout, stderr) ->
         if error
            console.log "温度取得失敗: " + stderr
         else
            temp = stdout+''
            temp = temp/1000
            if temp<40
               every = '0 * * * * *'
            else if temp<50
               user = "Shell" #ここのShellを変更必要
               robot.send user, "現在のCPU温度は#{new Date()}です！！！"
               every = '* * * * * *'
            else
               robot.send user, "オーバーヒート回避のため、停止します！！！！！"
               setTimeout ->
                  process.exit 0
               , 1000
   )
   cronjob.start()
