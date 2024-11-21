@ECHO OFF
title SD3_IMG_Creator
setlocal enabledelayedexpansion
cd /d %~dp0
for /f "tokens=1,* delims==" %%a in (SD3_setting.txt) do (
    set %%a=%%b
)
echo Stable Diffusion 3.0 API Image Creatorへようこそ！
echo このバッチファイルでは同じプロンプトで画像を連続で生成できます
:: STABILITY_API_KEY が設定されているか確認
if not defined STABILITY_API_KEY (
    echo エラー: APIキーがセットされていません、settings.txtに入力して保存してください
    echo APIキーを持っていない場合は https://platform.stability.ai/account/keys にアクセスしてAPIキーを取得してください
    GOTO :END_PROGRAM
    exit /b 1
)
:: 出力設定の確認
echo 以下の設定で出力します
echo プロンプト: %PROMPT%
echo ネガティブプロンプト: %NEG_PROMPT%
echo アスペクト比: %ASPECT_RATIO%
echo 保存フォーマット: %OUTPUT_FORMAT%
echo 出力枚数: %IMG_NUM%

:INPUT_CONF
ECHO この設定で生成しますか？ (同じプロンプトで生成する場合、上書きされてしまいます！ )
ECHO （Y / N）
SET CONF_SELECT=
SET /P CONF_SELECT=

IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :END_PROGRAM

:: API呼び出し
:CREATE_IMG
ECHO 画像を %IMG_NUM%枚 生成中...
for /L %%n in (1,1,%IMG_NUM%) do (
    curl -f -sS "https://api.stability.ai/v2beta/stable-image/generate/sd3" -H "authorization: %STABILITY_API_KEY%"   -H "accept: image/*"   -F prompt="%PROMPT%"  -F negative_prompt="%NEG_PROMPT%" -F aspect_ratio="%ASPECT_RATIO%" -F output_format="%OUTPUT_FORMAT%" -o "./SD3_image/%PROMPT%_%%n.%OUTPUT_FORMAT%"
    echo %%n枚生成完了
)

:: 結果表示
:DISPRAY_IMG
ECHO 生成が完了しました SD3_imageフォルダを確認してください

:END_PROGRAM

PAUSE
EXIT
