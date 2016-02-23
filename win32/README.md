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
```

3. Download a Windows 7 virtual machine from modernie.com, import it into VirtualBox and configure it with the settings below:  
    - **Display**
        - Video Memory: 64 MB
        - [X] Enable 3D Acceleration
        - [X] Enable 2D Video Acceleration  
    - **Shared Folders > Add Share**  
        - Folder Path: <cura-build folder>
        - Folder Name: cura-build
        - [X] Read-only
        - [X] Auto-mount
        - [X] Make Permanent

4. On your new virtual machine, give the shared folder you just created the drive letter **Z:**

5. On your new virtual machine, install the tools detailed below.


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
In the Windows virtual machine, open a command prompt and run the commands:
```
set PATH=C:\Python34\Lib\site-packages\PyQt5;C:\Python34\;C:\Python34\Scripts;C:\Windows\system32;C:\Windows;C:\CMake\bin;C:\Git\cmd;C:\GnuWin32\bin;C:\mingw-w64\mingw32\bin;C:\doxygen;C:\gettext
set Qt5_DIR=C:\Qt\Qt5.4.2\5.4\mingw491_32
set Qt5LinguistTools_DIR=C:\Qt\Qt5.4.2\5.4\mingw491_32\lib\cmake\Qt5LinguistTools
mkdir build && cd build
cmake -G "Unix Makefiles" Z:\
make
```

## Test
You can check if the build is running with the following commands (in the build folder):
```
set PATH=%PATH%;C:\mingw-w64\mingw32\bin
set PYTHONPATH=%CD%\inst\lib\python3.4\site-packages
set Qt5_DIR=C:\Python34\Lib\site-packages\PyQt5
set QT_QPA_PLATFORM_PLUGIN_PATH=C:\Python34\Lib\site-packages\PyQt5\plugins\platforms
set QML2_IMPORT_PATH=C:\Python34\Lib\site-packages\PyQt5\qml
python inst\bin\cura_app.py
```

## Troubleshooting

### When running, the add printer wizard opens but the main screen doesn't and the application freezes
Depending on your host operating system, VirtualBox and Guest Tools versions, it can happen than the graphics driver in the virtual machine doesn't support the full OpenGL specification that Cura uses extensively. So in these cases, to fully test the application you'll have to run it on a physical Windows machine.

### The splash screen shows but then the application exits silently, or nothing shows at all when running it
You'll have to debug the application start to discover what is going wrong. By default it compiles as a Windows executable and does not show any console output, but you can temporarily change the configuration to generate a console executable where all the Python output will be readable.  
Open the `setup_win32.py.in` file in the `cura-build` folder and look for the lines below (around line 80), making the following edit:
```python
#windows=[{"script": "inst/bin/cura_app.py", "dest_name": "Cura", "icon_resources": [(1, "@CMAKE_SOURCE_DIR@/cura.ico")]}], # Uncomment in production
console=[{"script": "inst/bin/cura_app.py", "dest_name": "Cura"}], # Comment in production
```
Then build everything again and when running Cura from the command prompt you'll have an error message stating what went wrong. After fixing the problem, revert this change.
