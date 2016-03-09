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
cd cura-build
git checkout 15.06
cd osx
vagrant up
vagrant ssh
```
3. The `vagrant up` command, if this is the first time you execute it, will have to download, setup and start a virtual machine image that is several GBs big, so it will take a while, maybe hours depending on your internet connection. But the image will stay in a local cache, so the next time it will be much quicker. After it, the `vagrant ssh` command will take you inside the virtual machine that Vagrant started. In there run the following commands:
```shell
mkdir build
cd build
cmake /vagrant
make
```
4. The build process will start. It will take a while (from 15 minutes to 2 hours depending on your hardware), so be patient.
5. Finally, to create the DMG package, run:
```shell
dmgbuild -s /vagrant/osx/dmg/package.py Deskbox dist/Deskbox.dmg
```
6. The installation package inside the virtual machine, in the `/Users/vagrant/build/dist` directory, with the name `Deskbox.dmg`. You can copy it anywhere else by using the file manager in the virtual machine, or you can access the virtual machine via an SFTP client like `FileZilla` (host: 192.168.33.10, user: vagrant, password: vagrant) and copy if off from there.
7. When you're done with the build, you should stop the virtual machine to free up the RAM and CPU resouces it allocates. Do this with:
```shell
exit
vagrant halt
```
8. Now that it is set up, you can restart your development environment at any time later by entering the `cura-build/osx` directory again and running the `vagrant up` command.
9. If are not planning to use this development environment anymore, or want to free disk space for other tasks, you can destroy the virtual machine with the command:
```shell
vagrant destroy
```

## Troubleshooting

### HTTP server doesn't seem to support byte ranges
This error can arise in the `vagrant up` command:
```
An error occurred while downloading the remote file. The error
message, if any, is reproduced below. Please fix this error and try
again.

HTTP server doesn't seem to support byte ranges. Cannot resume.
```
If this happens, copy the URL shown above the error message (at the time of this writing is `https://atlas.hashicorp.com/AndrewDryga/boxes/vagrant-box-osx/versions/0.2.1/providers/virtualbox.box` but that could change) and paste it into the address bar of your web browser, so you download the file. After that, open a terminal in that directory and run the command:
```shell
vagrant box add 'AndrewDryga/vagrant-box-osx' virtualbox.box
```
(Change `virtualbox.box` to the name of the file you downloaded, if it's different). This will manually install the box in your computer. Then, you can run `vagrant up` again and it will skip the download step, going on with the rest of the process.

### OS X Virtual Machine performance
If the OS X virtual machine feels slow and unresponsive, you can fix that installing the [BeamOff](https://github.com/rtrouton/rtrouton_scripts/blob/master/rtrouton_scripts/fix_yosemite_vm_graphic_performance/installer/fix_yosemite_vm_graphic_performance.zip) tool.
