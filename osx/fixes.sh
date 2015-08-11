#!/bin/sh
# This script fixes some glitches in the build process.
# Hopefully it will not be necessary anymore soon.
# Run it in the build directory inside the build machine.

set -e

build_dir=$(pwd)

echo 'Replace python34.zip.'
cp /vagrant/osx/lib/python34.zip $build_dir/dist/Deskbox.app/Contents/Resources/lib

echo 'Put translations in place.'

# Cura
for lang_dir in $build_dir/Cura-prefix/src/Cura/resources/i18n/*/; do
    cd $lang_dir
    msgfmt cura.po -o cura.mo
    msgfmt fdmprinter.json.po -o fdmprinter.json.mo
    lconvert -i cura_qt.po -o cura_qt.ts -target-language pt
    lrelease -compress -silent cura_qt.ts -qm cura_qt.qm
done
cp -rv $build_dir/Cura-prefix/src/Cura/resources/i18n/* $build_dir/dist/Deskbox.app/Contents/Resources/cura/resources/i18n

# Uranium
cd $build_dir/Uranium-prefix/src/Uranium-build
make translations
make copy-translations
cp -rv ?? $build_dir/dist/Deskbox.app/Contents/Resources/uranium/resources/i18n/
