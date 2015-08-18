This folder contains the assets necessary to create a .dmg package in Mac OS X.
To use it:

1. Build the application as described in `/README.md`.

2. Log into the build machine.
```shell
vagrant ssh
cd ~/build
```

2. Install [dmgbuild](https://bitbucket.org/al45tair/dmgbuild):  
```shell
sudo easy_install pip
sudo pip install dmgbuild
```

4. Build the image:  
```shell
dmgbuild -s /vagrant/osx/dmg/package.py Deskbox dist/Deskbox.dmg
```

The resulting image will be named `Deskbox.dmg` in the `dist` folder inside the build.
