#commands
コマンド一覧です
ここに書かれていないコマンドもあります

##[base64.coffee](https://github.com/github/hubot-scripts/blob/master/src/scripts/base64.coffee)
### `base64 -e|-d <テキスト>`
例：`base64 -e ごちうさ`とツイートすると`44GU44Gh44GG44GV`と返ってきます

##[conversation.coffee](https://github.com/github/hubot-scripts/blob/master/src/scripts/ping.coffee)
###`snowbit`
名前を呼ぶと何かしら返してくれます

##[flip.coffee](https://github.com/github/hubot-scripts/blob/master/src/scripts/flip.coffee)
文字をちゃぶ台返しのようにひっくり返してくれます<br>
注意!! : 日本語には対応していません
###`flip <text>`
例1：`flip` -> `(╯°□°）╯︵ ┻━┻`<br>
例2：`flip who are you` -> `(╯°□°）╯︵ noʎ ǝɹɐ oɥʍ`<br>
*`flip me`とツイートすると自分のスクリーンネームがひっくり返されます

###`rage flip <text>`
例1：`rage flip` -> `(ノಠ益ಠ)ノ彡 ┻━┻`<br>
例2：`rage flip Coffee` -> `(ノಠ益ಠ)ノ彡 ǝǝɟɟoↃ`<br>
*`flip me`とツイートすると自分のスクリーンネームがひっくり返されます
###`unflip <text>`
例1：`nonflip` -> `┬──┬ ノ( º _ ºノ)`<br>
例2：`nonflip hoge` -> `hoge ノ( º _ ºノ)`

##[google-images.coffee](https://github.com/github/hubot/blob/master/src/scripts/google-images.coffee)
###執筆中

##[google-search-api.coffee](https://github.com/github/hubot/blob/master/src/scripts/google-search-api.coffee)

##[ping.coffee](https://github.com/snowfox226/snowbit/blob/master/scripts/ping.coffee)
###`ping`or`ピン`
ポンと返してくれます<br>
`ping` -> `pong`<br>
`ピン` -> `ポン`
###`エコー`or`まね`
`エコー ほげ` -> `ほげ`<br>
`まね ほげ` -> `ほげ`
###`現在時刻`or`今何時？`
現在時刻を答えてくれます<br>
`今何時？` -> `現在の時刻は Tue Aug 12 2014 17:47:49 GMT+0900 (JST)です。`<br>
###`ごちうさ`or`こころぴょんぴょん`
こころぴょんぴょんしましょう<br>
`ごちうさ` -> `あぁ＾～心がぴょんぴょんするんじゃぁ＾～`って返ってくるだけ
###`snowfox226`or`ゆきさん`or`ゆきぎつね`
なんかよくわからない<br>
`ゆきさん` -> `ゆきさんはかわゆいんじゃぁ＾～（絶対）`

##[feeling.coffee](https://github.com/snowfox226/snowbit/blob/master/scripts/feeling.coffee)
###`気分どう？`
今のsnowbitの気分を答えてくれます
###`おみくじ`
おみくじをsnowbitとリプした相手の分を引いて答えてくれます

##[tellme.coffee](https://github.com/snowfox226/snowbit/blob/master/scripts/tellme.coffee)
###`tellme もふもふ度の計算式`
もふもふ度の計算式（適当）を返してくれます
###`tellme math 展開・因数分解の公式`
中学範囲の展開・因数分解の公式を返してくれます
###`tellme math 展開・因数分解の公式2`
高校範囲の展開・因数分解の公式を返してくれます
###`tellme math 二次方程式の公式`
二次方程式の公式を返してくれます
###`tellme math 三平方の定理`
三平方の定理を返してくれます

##[rules.coffee](https://github.com/github/hubot/blob/master/src/scripts/rules.coffee)
###`what are the 3 rules`
ロボット三原則を答えてくれます
`the three raws` ->

```
1. ロボットは人間に危害を加えてはならない。また、その危険を看過することによって、人間に危害を及ぼしてはならない。
2. ロボットは人間にあたえられた命令に服従しなければならない。ただし、あたえられた命令が、第一条に反する場合は、この限りでない。
3. ロボットは、前掲第一条および第二条に反するおそれのないかぎり、自己をまもらなければならない。
```
`apple`か`dev`を付けると以下のような文を答えてくれます

```
A developer may not injure Apple or, through inaction, allow Apple to come to harm.
A developer must obey any orders given to it by Apple, except where such orders would conflict with the First Law.
A developer must protect its own existence as long as such protection does not conflict with the First or Second Law.
```

正規表現：`(what are )?the (three |3 )?(rules|laws)`


##[translate.coffee](https://github.com/github/hubot/blob/master/src/scripts/translate.coffee)
google翻訳を使って翻訳してくれます
###` translate me <text>`
入力した文字を英語に翻訳します
###`translate me from <元の言語> into <翻訳したい言語> <text>`
元の言語から翻訳したい言語に翻訳します

####対応言語：
* af: アフリカーンス語
* sq: アルバニア語
* ar: アラビア語
* az: アゼルバイジャン語
* eu: バスク語
* bn: ベンガル語
* be: ベラルーシ語
* bg: ブルガリア語
* ca: カタロニア語
* zh-CN: 簡体字中国語
* zh-TW: 繁体字中国語
* hr: クロアチア語
* cs: チェコ語
* da: デンマーク語
* nl: オランダ語
* en: 英語
* eo: エスペラント語
* et: エストニア語
* tl: フィリピン語
* fi: フィンランド語
* fr: フランス語
* gl: ガリシア語
* ka: グルジア語
* de: ドイツ語
* el: ギリシャ語
* gu: グジャラート語
* ht: ハイチ語
* iw: ヘブライ語
* hi: ヒンディー語
* hu: ハンガリー語
* is: アイスランド語
* id: インドネシア語
* ga: アイルランド語
* it: イタリア語
* ja: 日本語
* kn: カンナダ語
* ko: 韓国語
* la: ラテン語
* lv: ラトビア語
* lt: リトアニア語
* mk: マケドニア語
* ms: マレー語
* mt: マルタ語
* no: ノルウェー語
* fa: ペルシア語
* pl: ポーランド語
* pt: ポルトガル語
* ro: ルーマニア語
* ru: ロシア語
* sr: セルビア語
* sk: スロバキア語
* sl: スロベニア語
* es: スペイン語
* sw: スワヒリ語
* sv: スウェーデン語
* ta: タミル語
* te: テルグ語
* th: タイ語
* tr: トルコ語
* uk: ウクライナ語
* ur: ウルドゥー語
* vi: ベトナム語
* cy: ウェールズ語
* yi: イディッシュ語
