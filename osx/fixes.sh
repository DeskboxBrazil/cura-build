#!/bin/sh -e
# This script fixes some glitches in the build process.
# Hopefully it will not be necessary anymore soon.
# Run it in the build directory inside the build machine.

build_dir=$(pwd)

echo 'Put translations in place.'

# Cura
cp -rv $build_dir/inst/share/cura/resources/firmware $build_dir/dist/Deskbox.app/Contents/Resources/cura/resources
cp -rv $build_dir/inst/share/cura/resources/i18n $build_dir/dist/Deskbox.app/Contents/Resources/cura/resources
# Build pt
cd $build_dir/Cura-prefix/src/Cura/resources/i18n/pt
compiled_lang_dir=$build_dir/dist/Deskbox.app/Contents/Resources/cura/resources/i18n/pt/LC_MESSAGES
mkdir -p $compiled_lang_dir
msgfmt cura.po -o $compiled_lang_dir/cura.mo
msgfmt fdmprinter.json.po -o $compiled_lang_dir/fdmprinter.json.mo
lconvert -i cura_qt.po -o cura_qt.ts -target-language pt
lrelease -compress -silent cura_qt.ts -qm $compiled_lang_dir/cura_qt.qm

# Uranium
cp -rv $build_dir/inst/share/uranium/resources/i18n $build_dir/dist/Deskbox.app/Contents/Resources/uranium/resources
# Build pt
cd $build_dir/Uranium-prefix/src/Uranium/resources/i18n/pt
compiled_lang_dir=$build_dir/dist/Deskbox.app/Contents/Resources/uranium/resources/i18n/pt/LC_MESSAGES
mkdir -p $compiled_lang_dir
msgfmt uranium.po -o $compiled_lang_dir/uranium.mo
lconvert -i uranium_qt.po -o uranium_qt.ts -target-language pt
lrelease -compress -silent uranium_qt.ts -qm $compiled_lang_dir/uranium_qt.qm

echo "Fixes applied."
