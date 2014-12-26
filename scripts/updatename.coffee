# Description:
#   Allows hubot to update itself using git pull and npm update.
#   If updates are downloaded you'll need to restart hubot, for example using "hubot die" (restart using a watcher like forever.js).
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot update - Performs a git pull and npm udate.
#   hubot pending update - Informs if there are pending updates (hubot needs a restart)
#
# Author:
#   snvx
#
# License;
#   Copyright (c) 2014 snvx.
#   Released under the Apacne v2 License.
#   https://github.com/snowbit/snowbit/blob/master/LICENSE

module.exports = (robot) ->
  robot.respond //i, (msg) ->

