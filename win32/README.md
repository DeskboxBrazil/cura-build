# Windows
Follow the instructions below to build the Windows package:

1. Install the following applications in your computer, by downloading them or via a package manager if your operating system has one:
    * [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
    * [Git](https://git-scm.com/downloads)
2. Open a terminal/command/console window and run the following commands, one at a time:
```shell
git clone https://github.com/DeskboxBrazil/cura-build.git
cd cura-build
git checkout 15.06
cd osx
vagrant up
vagrant ssh
```
3. Download a Windows 7 virtual machine from modernie.com, import it into VirtualBox and configure it with the settings below:  
    **Display**
    - Video Memory: 64 MB
    - [X] Enable 3D Acceleration
    - [X] Enable 2D Video Acceleration
4. On your new virtual machine, install the tools detailed below.


Tools
-----
You need to install the following dependencies to be able to build the application.  
Please take care of following the installation notes for every one of them:

* MingW GCC <http://ufpr.dl.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/installer/mingw-w64-install.exe>
	* Architecture: i686
	* Threads: posix
	* Install on C:\mingw-w64
* Qt 5.4 <http://download.qt.io/archive/qt/5.4/5.4.2/qt-opensource-windows-x86-mingw491_opengl-5.4.2.exe>
	* Install on C:\Qt
* Python 3.4.4 <https://www.python.org/ftp/python/3.4.4/python-3.4.4.msi>
	* Enable the option: Add python.exe to Path
	* Install on C:\Python34
	* After installation:
		* Open a Windows Command Prompt and execute:
			* pip install pyserial
			* pip install py2exe
			* pip install protobuf==3.0.0b2
				* ``echo # > C:\Python34\Lib\site-packages\google\__init__.py`` (this is necessary for py2exe to correctly detect this package)
		* Download <http://www.lfd.uci.edu/%7Egohlke/pythonlibs/wkvprmqy/numpy-1.10.4+mkl-cp34-none-win32.whl>
			* Open a Windows Command Prompt and execute:
				* cd Downloads
				* pip install numpy-1.10.4+mkl-cp34-none-win32.whl
* PyQt 5.4 <http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.4.2/PyQt5-5.4.2-gpl-Py3.4-Qt5.4.2-x32.exe/download>
* CMake <https://cmake.org/files/v3.4/cmake-3.4.1-win32-x86.exe>
	* Select: Add Cmake to the system PATH for all users
	* Install on C:\CMake
* Make <http://sourceforge.net/projects/gnuwin32/files/make/3.81/make-3.81.exe/download>
	* Install on C:\GnuWin32
* Gettext <https://github.com/mlocati/gettext-iconv-windows/releases/download/v0.19.6-v1.14/gettext0.19.6-iconv1.14-static-32.exe>
	* Install on C:\gettext
* Wget <http://downloads.sourceforge.net/gnuwin32/wget-1.11.4-1-setup.exe>
	* Install on C:\GnuWin32
* Doxygen <http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.11-setup.exe>
	* Install on C:\doxygen
* Git <https://github.com/git-for-windows/git/releases/download/v2.7.0.windows.1/Git-2.7.0-32-bit.exe>
	* Install on C:\Git
	* Select: Use Git from the Windows Command Prompt
	* Select: Use Windows ' default console window
* NSIS <http://downloads.sourceforge.net/project/nsis/NSIS%203%20Pre-release/3.0b3/nsis-3.0b3-setup.exe?r=http%3A%2F%2Fnsis.sourceforge.net%2FDownload&ts=1452876911&use_mirror=ufpr>
	* Install on C:\NSIS


Build
-----
```
cd %HOME%
git clone <https://github.com/DeskboxBrazil/cura-build.git>
cd cura-build

set PATH=C:\Python34\Lib\site-packages\PyQt5;C:\Python34\;C:\Python34\Scripts;C:\Windows\system32;C:\Windows;C:\CMake\bin;C:\Git\cmd;C:\GnuWin32\bin;C:\mingw-w64\mingw32\bin;C:\doxygen;C:\gettext
set Qt5_DIR=C:\Qt\Qt5.4.2\5.4\mingw491_32
set Qt5LinguistTools_DIR=C:\Qt\Qt5.4.2\5.4\mingw491_32\lib\cmake\Qt5LinguistTools

mkdir build && cd build && cmake -G "Unix Makefiles" .. && make
```

## Test
```
set PATH=%PATH%;C:\mingw-w64\mingw32\bin
set PYTHONPATH=%CD%\inst\lib\python3.4\site-packages
set Qt5_DIR=C:\Python34\Lib\site-packages\PyQt5
set QT_QPA_PLATFORM_PLUGIN_PATH=C:\Python34\Lib\site-packages\PyQt5\plugins\platforms
set QML2_IMPORT_PATH=C:\Python34\Lib\site-packages\PyQt5\qml
python inst\bin\cura_app.py
```
