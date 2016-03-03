@echo off
set PATH=%PATH%;C:\mingw-w64\mingw32\bin
set PYTHONPATH=%CD%\inst\lib\python3.4\site-packages
set Qt5_DIR=C:\Python34\Lib\site-packages\PyQt5
set QT_QPA_PLATFORM_PLUGIN_PATH=C:\Python34\Lib\site-packages\PyQt5\plugins\platforms
set QML2_IMPORT_PATH=C:\Python34\Lib\site-packages\PyQt5\qml
python inst\bin\cura_app.py
