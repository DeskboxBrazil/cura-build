This folder contains the assets necessary to create a .dmg package in Mac OS X.
To use it:

1. Build the application as described in `../README.md`.

2. Copy the `python34.zip` file from this folder to `../build/dist/Deskbox.app/Contents/Resources/lib`, replacing the already existing one there:
```shell
cp python34.zip ../build/dist/Deskbox.app/Contents/Resources
```

3. Install [dmgbuild](https://bitbucket.org/al45tair/dmgbuild):  
```shell
sudo easy_install pip
sudo pip install dmgbuild
```

4. Build the image:  
```shell
dmgbuild -s package.py Deskbox Deskbox.dmg
```

The resulting image will be named `Deskbox.dmg` in this folder.
