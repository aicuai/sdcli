@ECHO OFF
title SIC_IMG_Creator
setlocal enabledelayedexpansion
cd /d %~dp0
for /f "tokens=1,* delims==" %%a in (SIC_setting.txt) do (
    set %%a=%%b
)
set STYLE_PRESET[1]=3d-model
set STYLE_PRESET[2]=analog-film
set STYLE_PRESET[3]=anime
set STYLE_PRESET[4]=cinematic
set STYLE_PRESET[5]=comic-book
set STYLE_PRESET[6]=digital-art
set STYLE_PRESET[7]=enhance
set STYLE_PRESET[8]=fantasy-art
set STYLE_PRESET[9]=isometric
set STYLE_PRESET[10]=line-art
set STYLE_PRESET[11]=low-poly
set STYLE_PRESET[12]=modeling-compound
set STYLE_PRESET[13]=neon-punk
set STYLE_PRESET[14]=origami
set STYLE_PRESET[15]=photographic
set STYLE_PRESET[16]=pixel-art
set STYLE_PRESET[17]=tile-texture
set STYLE_PRESETNOW=

echo Stable Image Core API Image Creatorへようこそ！
echo このバッチファイルでは同じプロンプトで複数のスタイルの画像を連続で生成できます
:: STABILITY_API_KEY が設定されているか確認
if not defined STABILITY_API_KEY (
    echo エラー: APIキーがセットされていません、settings.txtに入力して保存してください
    echo APIキーを持っていない場合は https://platform.stability.ai/account/keys にアクセスしてAPIキーを取得してください
    GOTO :END_PROGRAM
    exit /b 1
)
set /a all_img_num=%IMG_NUM%*17
:: 出力設定の確認
echo 以下の設定で出力します
echo プロンプト: %PROMPT%
echo ネガティブプロンプト: %NEG_PROMPT%
echo アスペクト比: %ASPECT_RATIO%
echo 保存フォーマット: %OUTPUT_FORMAT%
echo 出力サイクル数: %IMG_NUM%
echo 合計出力枚数: %all_img_num%

:INPUT_CONF
ECHO この設定で生成しますか？ (同じプロンプトで生成する場合、上書きされてしまいます！ )
ECHO （Y / N）
SET CONF_SELECT=
SET /P CONF_SELECT=

IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :END_PROGRAM

:: API呼び出し
:CREATE_IMG
ECHO 画像を %all_img_num%枚 生成中...
for /L %%n in (1,1,%IMG_NUM%) do (
    for /L %%i in (1,1,17) do (
        set STYLE_PRESET_NOW=!STYLE_PRESET[%%i]!
        echo !STYLE_PRESET_NOW!スタイル で生成中...
        curl -f -sS "https://api.stability.ai/v2beta/stable-image/generate/core" -H "authorization: %STABILITY_API_KEY%"   -H "accept: image/*"   -F prompt="%PROMPT%"  -F negative_prompt="%NEG_PROMPT%" -F style_preset="!STYLE_PRESET_NOW!" -F aspect_ratio="%ASPECT_RATIO%" -F output_format="%OUTPUT_FORMAT%" -o "./SIC_image/%PROMPT%_!STYLE_PRESET_NOW!_%%n.%OUTPUT_FORMAT%"
    )
    echo %%nサイクル 生成完了
)
:: 結果表示
:DISPRAY_IMG
ECHO 生成が完了しました SIC_imageフォルダを確認してください

:END_PROGRAM

PAUSE
EXIT
