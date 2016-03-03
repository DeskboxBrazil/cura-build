@echo off

set PATH=C:\Python34\Lib\site-packages\PyQt5;C:\Python34\;C:\Python34\Scripts;C:\Windows\system32;C:\Windows;C:\CMake\bin;C:\Git\cmd;C:\GnuWin32\bin;C:\mingw-w64\mingw32\bin;C:\doxygen;C:\gettext
set Qt5_DIR=C:\Qt\Qt5.4.2\5.4\mingw491_32
set Qt5LinguistTools_DIR=C:\Qt\Qt5.4.2\5.4\mingw491_32\lib\cmake\Qt5LinguistTools
set PYTHONPATH=%CD%\inst\lib\python3.4\site-packages
set QT_QPA_PLATFORM_PLUGIN_PATH=C:\Python34\Lib\site-packages\PyQt5\plugins\platforms
set QML2_IMPORT_PATH=C:\Python34\Lib\site-packages\PyQt5\qml

cmake -G "Unix Makefiles" Z:\
make package
