@ECHO OFF
title SD3_IMG_Creator
setlocal enabledelayedexpansion
cd /d %~dp0
for /f "tokens=1,* delims==" %%a in (SD3_setting.txt) do (
    set %%a=%%b
)
echo Stable Diffusion 3.0 API Image Creator�ւ悤�����I
echo ���̃o�b�`�t�@�C���ł͓����v�����v�g�ŉ摜��A���Ő����ł��܂�
:: STABILITY_API_KEY ���ݒ肳��Ă��邩�m�F
if not defined STABILITY_API_KEY (
    echo �G���[: API�L�[���Z�b�g����Ă��܂���Asettings.txt�ɓ��͂��ĕۑ����Ă�������
    echo API�L�[�������Ă��Ȃ��ꍇ�� https://platform.stability.ai/account/keys �ɃA�N�Z�X����API�L�[���擾���Ă�������
    GOTO :END_PROGRAM
    exit /b 1
)
:: �o�͐ݒ�̊m�F
echo �ȉ��̐ݒ�ŏo�͂��܂�
echo �v�����v�g: %PROMPT%
echo �l�K�e�B�u�v�����v�g: %NEG_PROMPT%
echo �A�X�y�N�g��: %ASPECT_RATIO%
echo �ۑ��t�H�[�}�b�g: %OUTPUT_FORMAT%
echo �o�͖���: %IMG_NUM%

:INPUT_CONF
ECHO ���̐ݒ�Ő������܂����H (�����v�����v�g�Ő�������ꍇ�A�㏑������Ă��܂��܂��I )
ECHO �iY / N�j
SET CONF_SELECT=
SET /P CONF_SELECT=

IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :END_PROGRAM

:: API�Ăяo��
:CREATE_IMG
ECHO �摜�� %IMG_NUM%�� ������...
for /L %%n in (1,1,%IMG_NUM%) do (
    curl -f -sS "https://api.stability.ai/v2beta/stable-image/generate/sd3" -H "authorization: %STABILITY_API_KEY%"   -H "accept: image/*"   -F prompt="%PROMPT%"  -F negative_prompt="%NEG_PROMPT%" -F aspect_ratio="%ASPECT_RATIO%" -F output_format="%OUTPUT_FORMAT%" -o "./SD3_image/%PROMPT%_%%n.%OUTPUT_FORMAT%"
    echo %%n����������
)

:: ���ʕ\��
:DISPRAY_IMG
ECHO �������������܂��� SD3_image�t�H���_���m�F���Ă�������

:END_PROGRAM

PAUSE
EXIT
