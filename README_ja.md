# sdcli
Command line tools for Stability AI API 

こちらのURLで配布されていたツールをメンテしています

- <https://j.aicu.ai/SaiImgBat>  

関連記事

- [高品質なAI画像を大量生産！ Stability AIのAPIをWindowsのバッチファイルで呼び出せるようにしてみた【窓の杜:生成AIストリーム】](https://forest.watch.impress.co.jp/docs/serial/aistream/1621329.html)


|[English](README.md)|[日本語](README_ja.md)|

## SD3_SIC_Image_Creator


## これは何？


Stable Diffusion 3.0 API Image Creator / Stable Image Core API Image Creatorのreadme
このバッチファイルをダウンロードいただきありがとうございます
以下の説明をお読みになってからお使いください
なお、このプログラムを用いて発生したいかなる障害に対して責任は負いませんのでご了承ください。

## 機能

Stable Diffusion 3.0 とStable Image Core のAPIを用いて画像を生成することができます
2つのバッチファイルでできることは異なります

### Stable Diffusion 3.0 API Image Creatorでできること

・同じプロンプトでの連続画像生成
・文字も含めた生成

### Stable Image Core API Image Creatorでできること

・同じプロンプトで様々なプリセットスタイルの画像生成


## 使い方

### (1)はじめにやること

このバッチファイルを使って画像生成するにはAPIキーが必要です
バッチファイルを起動する前に https://platform.stability.ai/account/keys にアクセスしてAPIキーを取得してください

### (2)APIキーやプロンプトの設定

プロンプトなどの設定はそれぞれのテキストファイルから行います
設定するにはメモ帳などのテキストエディタで編集してください

・Stable Diffusion 3.0 API Image Creatorの場合
SD3_setting.txt が設定ファイルです
[PROMPT=urban street]のように記載してファイルを保存してください
また、すべての項目を記載しないと動作しないので注意してください

[設定可能な項目]
プロンプト
ネガティブプロンプト
アスペクト比(以下が使用できます　1:1 16:9 1:1 21:9 2:3 3:2 4:5 5:4 9:16 9:21)
出力するフォーマット(以下が使用できます　jpeg png webp)
生成枚数
APIキー

・Stable Image Core API Image Creatorの場合
SIC_setting.txt が設定ファイルです
[PROMPT=urban street]のように記載してファイルを保存してください
また、すべての項目を記載しないと動作しないので注意してください
[設定可能な項目]
プロンプト
ネガティブプロンプト
アスペクト比(以下が使用できます　1:1 16:9 1:1 21:9 2:3 3:2 4:5 5:4 9:16 9:21)
出力するフォーマット(以下が使用できます　jpeg png webp)
生成サイクル数（生成サイクル数x17枚生成されます）
APIキー

### (3)バッチファイルの起動

バッチファイルはダブルクリックで起動できます
・Stable Diffusion 3.0 API Image Creatorの場合
SD3_IMG_Creator.batをダブルクリックして起動してください

・Stable Image Core API Image Creatorの場合
SIC_IMG_Creator.batをダブルクリックして起動してください

## (4)画像の生成

それぞれのバッチファイルを起動すると、現在の設定が表示されます


```
Stable Image Core API Image Creatorへようこそ！
このバッチファイルでは同じプロンプトで複数のスタイルの画像を連続で生成できます
以下の設定で出力します
プロンプト: urban street
ネガティブプロンプト: NSFW
アスペクト比: 16:9
保存フォーマット: png
出力サイクル数: 1
合計出力枚数: 17
この設定で生成しますか？ (同じプロンプトで生成する場合、上書きされてしまいます！ )
（Y / N）
```

この設定で生成する場合は[y]と入力して[Enter]キーを押してください

* 現在は日本語表示ですが、英語に統一するかもです。

## (5)生成された画像の確認

生成された画像はエクスプローラーで確認することができます
生成された後にもう一度同じプロンプトで生成する場合は画像を別の場所に移動してから実行してください
移動しないと上書きされてしまいます

・Stable Diffusion 3.0 API Image Creatorの場合
SD3_imageフォルダに保存されています

・Stable Image Core API Image Creatorの場合
SIC_imageフォルダに保存されています


## FAQ

[Q1]バッチファイルを実行したら「WindowsによってPCが保護されました」と表示される
[A1]バッチファイルに署名がされていないためです
    実行するには「詳細情報」を押して「実行する」を表示させてください

[Q2]バッチファイルを実行したらエラーと表示され、プログラムが終了してしまった
[A2]APIキーが入力されていない場合、エラーとなりプログラムが終了してしまいます
    設定ファイルを開いてAPIキーを入力してください

[Q3]生成した画像に靄がかかっています...
[A3]生成した画像に「NSFW-職場回覧注意」な要素があると生成時に靄がかけられてしまいます
    ネガティブプロンプトに「NSFW」と入力すると靄がかかった画像を減らすことができます

[Q4]バッチファイルは実行できるけど画像が生成されない
[A4]設定ファイルを見直してください
    すべての設定項目を埋めないと画像を生成することができません

[Q4]このバッチファイルを改変してもいいですか？
[A4]改変等は構いません。著作権はAICU Inc. が保有します。

[Q5]このプログラムは商用利用できますか？
[A5]Stability AIの商用ライセンスはAPIの利用許諾に準じます。商用利用、カスタマイズにつきましては sai@aicu.ai までお問い合わせください。


