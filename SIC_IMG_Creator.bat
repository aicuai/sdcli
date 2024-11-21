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

echo Stable Image Core API Image Creator�ւ悤�����I
echo ���̃o�b�`�t�@�C���ł͓����v�����v�g�ŕ����̃X�^�C���̉摜��A���Ő����ł��܂�
:: STABILITY_API_KEY ���ݒ肳��Ă��邩�m�F
if not defined STABILITY_API_KEY (
    echo �G���[: API�L�[���Z�b�g����Ă��܂���Asettings.txt�ɓ��͂��ĕۑ����Ă�������
    echo API�L�[�������Ă��Ȃ��ꍇ�� https://platform.stability.ai/account/keys �ɃA�N�Z�X����API�L�[���擾���Ă�������
    GOTO :END_PROGRAM
    exit /b 1
)
set /a all_img_num=%IMG_NUM%*17
:: �o�͐ݒ�̊m�F
echo �ȉ��̐ݒ�ŏo�͂��܂�
echo �v�����v�g: %PROMPT%
echo �l�K�e�B�u�v�����v�g: %NEG_PROMPT%
echo �A�X�y�N�g��: %ASPECT_RATIO%
echo �ۑ��t�H�[�}�b�g: %OUTPUT_FORMAT%
echo �o�̓T�C�N����: %IMG_NUM%
echo ���v�o�͖���: %all_img_num%

:INPUT_CONF
ECHO ���̐ݒ�Ő������܂����H (�����v�����v�g�Ő�������ꍇ�A�㏑������Ă��܂��܂��I )
ECHO �iY / N�j
SET CONF_SELECT=
SET /P CONF_SELECT=

IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :END_PROGRAM

:: API�Ăяo��
:CREATE_IMG
ECHO �摜�� %all_img_num%�� ������...
for /L %%n in (1,1,%IMG_NUM%) do (
    for /L %%i in (1,1,17) do (
        set STYLE_PRESET_NOW=!STYLE_PRESET[%%i]!
        echo !STYLE_PRESET_NOW!�X�^�C�� �Ő�����...
        curl -f -sS "https://api.stability.ai/v2beta/stable-image/generate/core" -H "authorization: %STABILITY_API_KEY%"   -H "accept: image/*"   -F prompt="%PROMPT%"  -F negative_prompt="%NEG_PROMPT%" -F style_preset="!STYLE_PRESET_NOW!" -F aspect_ratio="%ASPECT_RATIO%" -F output_format="%OUTPUT_FORMAT%" -o "./SIC_image/%PROMPT%_!STYLE_PRESET_NOW!_%%n.%OUTPUT_FORMAT%"
    )
    echo %%n�T�C�N�� ��������
)
:: ���ʕ\��
:DISPRAY_IMG
ECHO �������������܂��� SIC_image�t�H���_���m�F���Ă�������

:END_PROGRAM

PAUSE
EXIT
