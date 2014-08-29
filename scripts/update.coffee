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
#   benjamine
#
# License;
#   Copyright (c) 2014 GitHub Inc.
#   Released under the MIT license
#   https://github.com/snowbit/snowbit/blob/master/NOTICE

child_process = require 'child_process'
downloaded_updates = false

module.exports = (robot) ->

    robot.respond /pending updates?\??$/i, (msg) ->
        if downloaded_updates
            msg.send "未適用アップデートがあります。私を停止してください！(ヒント: hubot die)"
        else
            msg.send "最新です！"

    robot.respond /update( yourself)?$/i, (msg) ->
        changes = false
        try
            msg.send "gitをプル中です..."
            child_process.exec 'git pull', (error, stdout, stderr) ->
                if error
                    msg.send "gitをプルするのに失敗しました: " + stderr
                else
                    output = stdout+''
                    if not /Already up\-to\-date/.test output
                        msg.send "ソースが変更されました:\n" + output
                        changes = true
                    else
                        msg.send "ソースは最新です"
                try
                    msg.send "npmをアップデートします..."
                    child_process.exec 'npm update', (error, stdout, stderr) ->
                        if error
                            msg.send "npmをアップデートするのに失敗しました: " + stderr
                        else
                            output = stdout+''
                            if /node_modules/.test output
                                msg.send "いくつかのdependenciesがアップデートされました:\n" + output
                                changes = true
                            else
                                msg.send "すべてのdependenciesは最新です"
                        if changes
                            downloaded_updates = true
                            msg.send "いくつかのアップデートをダウンロードしました。私を停止してください！(ヒント: hubot die)"
                        else
                            if downloaded_updates
                                msg.send "未適用のいくつかのアップデートがあります。私を停止してください！(ヒント: hubot die)"
                            else
                                msg.send "最新です!"
                catch error
                    msg.send "npmをアップデートするのに失敗しました: " + error
        catch error
            msg.send "gitをプルするのに失敗しました: " + error


