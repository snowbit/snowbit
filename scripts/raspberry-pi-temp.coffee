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


var wsh = new ActiveXObject("WScript.Shell");

function withExecCommand(cmd, func) {
	var exec = wsh.exec(cmd);
	while (!exec.StdOut.AtEndOfStream) {
		func(exec.StdOut.ReadLine());
	}
	return exec.ExitCode;
}

function execCommand(cmd) {
	return withExecCommand(cmd, function (line) { WScript.Echo(line);});
}

var Temp = execCommand("cmd $ cat /sys/class/thermal/thermal_zone0/temp");
var TempC = (Temp/1000)

module.exports = (robot) ->
  robot.respond /RaspberryPi getTemp/i, (msg) ->
      msg.reply "現在のRaspberryPiの温度は" + TempC + "です。";