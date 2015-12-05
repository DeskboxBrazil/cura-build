# OS X
Follow the instructions below to build the OS X package:

1. Install the following applications in your computer, by downloading them or via a package manager if your operating system has one:
    * [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
    * [Vagrant](https://www.vagrantup.com/downloads.html)
    * [Git](https://git-scm.com/downloads)
    * [RSync](https://rsync.samba.org/download.html)
2. Open a terminal/command/console window and run the following commands, one at a time:
```shell
git clone https://github.com/DeskboxBrazil/cura-build.git
cd cura-build/osx
vagrant up
vagrant ssh
```
3. The `vagrant up`, if this is the first time you execute it, will have to download, setup and start a virtual machine image that is several GBs big, so it will take a while, maybe hours depending on your internet connection. But the image will stay in a local cache, so the next time it will be almost instant. After it, the `vagrant ssh` command will take you inside the virtual machine that Vagrant started. In there run the following commands:
```shell
mkdir build
cd build
cmake /vagrant
make
```
4. The build process will start. It will take a while (from 15 minutes to 2 hours depending on your hardware), so be patient.
5. After build is complete, run:
```shell
/vagrant/osx/fixes
```
6. Finally, to create the DMG package, run:
```shell
dmgbuild -s /vagrant/osx/dmg/package.py Deskbox dist/Deskbox.dmg
```
6. The installation package inside the virtual machine, in the `/Users/vagrant/build/dist` directory, with the name `Deskbox.dmg`. You can copy it anywhere else by using the file manager in the virtual machine, or you can access the virtual machine via an SFTP client like `FileZilla` (host: 192.168.33.10, user: vagrant, password: vagrant) and copy if off from there.

## Note about OS X performance
If the OS X virtual machine feels slow and unresponsive, you can fix that by installing the [BeamOff](https://github.com/rtrouton/rtrouton_scripts/blob/master/rtrouton_scripts/fix_yosemite_vm_graphic_performance/installer/fix_yosemite_vm_graphic_performance.zip) tool.
