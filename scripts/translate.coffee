# Description:
#   Allows Hubot to know many languages.
#
# Commands:
#   hubot translate me <phrase> - Searches for a translation for the <phrase> and then prints that bad boy out.
#   hubot translate me from <source> into <target> <phrase> - Translates <phrase> from <source> into <target>. Both <source> and <target> are optional
#
# License;
#   Copyright (c) 2014 GitHub Inc.
#   Released under the MIT license
#   https://github.com/snowbit/snowbit/blob/master/NOTICE

languages =
  "af": "アフリカーンズ語",
  "sq": "アルバニア語",
  "ar": "アラビア語",
  "az": "アゼルバイジャン語",
  "eu": "バスク語",
  "bn": "ベンガル語",
  "be": "ベラルーシ語",
  "bg": "ブルガリア語",
  "ca": "カタロニア語",
  "zh-CN": "簡体字中国語",
  "zh-TW": "繁体字中国語",
  "hr": "クロアチア語",
  "cs": "チェコ語",
  "da": "デンマーク語",
  "nl": "オランダ語",
  "en": "英語",
  "eo": "エスペラント語",
  "et": "エストニア",
  "tl": "フィリピン語",
  "fi": "フィンランド語",
  "fr": "フランス語",
  "gl": "ガリシア語",
  "ka": "グルジア語",
  "de": "ドイツ語",
  "el": "ギリシャ語",
  "gu": "グシャラート語",
  "ht": "ハイチ語",
  "iw": "ヘブライ語",
  "hi": "ヒンディー語",
  "hu": "ハンガリー語",
  "is": "アイスランド語",
  "id": "イタリア語",
  "ga": "アイルランド語",
  "it": "イタリア語",
  "ja": "日本語",
  "kn": "カンナダ語",
  "ko": "韓国語",
  "la": "ラテン語",
  "lv": "ラトビア語",
  "lt": "リトアニア語",
  "mk": "マケドニア語",
  "ms": "マレー語",
  "mt": "マルタ語",
  "no": "ノルウェー語",
  "fa": "ペルシア語",
  "pl": "ポーランド語",
  "pt": "ポルトガル語",
  "ro": "ルーマニア語",
  "ru": "ロシア語",
  "sr": "セルビア語",
  "sk": "スロバキア語",
  "sl": "スロベニア語",
  "es": "スペイン語",
  "sw": "スワヒリ語",
  "sv": "スウェーデン語",
  "ta": "タミル語",
  "te": "テルグ語",
  "th": "タイ語",
  "tr": "トルコ語",
  "uk": "ウクライナ語",
  "ur": "ウルドゥー語",
  "vi": "ベトナム語",
  "cy": "ウェールズ語",
  "yi": "イディッシュ語",
  "af": "Afrikaans",
  "sq": "Albanian",
  "ar": "Arabic",
  "az": "Azerbaijani",
  "eu": "Basque",
  "bn": "Bengali",
  "be": "Belarusian",
  "bg": "Bulgarian",
  "ca": "Catalan",
  "zh-CN": "Simplified Chinese",
  "zh-TW": "Traditional Chinese",
  "hr": "Croatian",
  "cs": "Czech",
  "da": "Danish",
  "nl": "Dutch",
  "en": "English",
  "eo": "Esperanto",
  "et": "Estonian",
  "tl": "Filipino",
  "fi": "Finnish",
  "fr": "French",
  "gl": "Galician",
  "ka": "Georgian",
  "de": "German",
  "el": "Greek",
  "gu": "Gujarati",
  "ht": "Haitian Creole",
  "iw": "Hebrew",
  "hi": "Hindi",
  "hu": "Hungarian",
  "is": "Icelandic",
  "id": "Indonesian",
  "ga": "Irish",
  "it": "Italian",
  "ja": "Japanese",
  "kn": "Kannada",
  "ko": "Korean",
  "la": "Latin",
  "lv": "Latvian",
  "lt": "Lithuanian",
  "mk": "Macedonian",
  "ms": "Malay",
  "mt": "Maltese",
  "no": "Norwegian",
  "fa": "Persian",
  "pl": "Polish",
  "pt": "Portuguese",
  "ro": "Romanian",
  "ru": "Russian",
  "sr": "Serbian",
  "sk": "Slovak",
  "sl": "Slovenian",
  "es": "Spanish",
  "sw": "Swahili",
  "sv": "Swedish",
  "ta": "Tamil",
  "te": "Telugu",
  "th": "Thai",
  "tr": "Turkish",
  "uk": "Ukrainian",
  "ur": "Urdu",
  "vi": "Vietnamese",
  "cy": "Welsh",
  "yi": "Yiddish"

getCode = (language,languages) ->
  for code, lang of languages
      return code if lang.toLowerCase() is language.toLowerCase()

module.exports = (robot) ->
  language_choices = (language for _, language of languages).sort().join('|')
  pattern = new RegExp('translate(?: me)?' +
                       "(?: from (#{language_choices}))?" +
                       "(?: (?:in)?to (#{language_choices}))?" +
                       '(.*)', 'i')
  robot.respond pattern, (msg) ->
    term   = "\"#{msg.match[3]}\""
    origin = if msg.match[1] isnt undefined then getCode(msg.match[1], languages) else 'auto'
    target = if msg.match[2] isnt undefined then getCode(msg.match[2], languages) else 'en'
    
    msg.http("https://translate.google.com/translate_a/t")
      .query({
        client: 't'
        hl: 'en'
        multires: 1
        sc: 1
        sl: origin
        ssel: 0
        tl: target
        tsel: 0
        uptl: "en"
        text: term
      })
      .header('User-Agent', 'Mozilla/5.0')
      .get() (err, res, body) ->
        data   = body
        if data.length > 4 and data[0] == '['
          parsed = eval(data)
          language =languages[parsed[2]]
          parsed = parsed[0] and parsed[0][0] and parsed[0][0][0]
          if parsed
            if msg.match[2] is undefined
              msg.reply "#{language} での #{term} は英語で  #{parsed} と言います"
            else
              msg.reply "#{language} の #{term} は #{languages[target]} で #{parsed} と言います"

