@rem 作成日23年03月18日、作成者 YutaEzoe
chcp 65001

@ECHO OFF
 
:INPUT_START
ECHO +-------------------------------------------------------+
ECHO  新規作成する仮想環境の名前を入力してください。
ECHO  Enter the name of the new virtual environment to be created.
ECHO +-------------------------------------------------------+
SET INPUT_STR=
SET /P INPUT_STR=
 
IF "%INPUT_STR%"=="" GOTO :INPUT_START
 
:INPUT_CONF
ECHO +-------------------------------------------------------+
ECHO  入力した文字は[%INPUT_STR%]でよろしいですか？
ECHO  Are you sure the characters you entered are [%INPUT_STR%]?
ECHO （Y / N）
ECHO +-------------------------------------------------------+
SET CONF_SELECT=
SET /P CONF_SELECT=
 
IF "%CONF_SELECT%"== SET CONF_SELECT=Y
IF /I NOT "%CONF_SELECT%"=="Y"  GOTO :INPUT_START

:INPUT_END

python -m venv %INPUT_STR%

SET VENV_ACTIVATE=\Scripts\activate
CALL %INPUT_STR%%VENV_ACTIVATE%

SET FILE1=pipPackages.txt

IF EXIST %FILE1% (
 for /f %%a in (%FILE1%) do (
  pip install %%a
)
) ELSE (
 ECHO pipPackages.txt does not exist.
 GOTO :GOTO_END
)

pip install cx_Freeze

copy *.py %INPUT_STR%

SET BUILD_COMMAND=\setup.py build
echo %INPUT_STR%%BUILD_COMMAND%
python %INPUT_STR%%BUILD_COMMAND%

CALL deactivate

:GOTO_END
ECHO +-------------------------------------------------------+
ECHO  完了しました。
ECHO +-------------------------------------------------------+
 
PAUSE
EXIT