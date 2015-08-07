#!/bin/sh
# This script fixes some glitches in the build process.
# Hopefully it will not be necessary anymore soon.
# Call it from the build directory.

set -e

build_dir=$(pwd)

# Cura
cd $build_dir/Cura-prefix/src/Cura/resources/i18n/pt
msgfmt cura.po -o cura.mo
msgfmt fdmprinter.json.po -o fdmprinter.json.mo
lconvert -i cura_qt.po -o cura_qt.ts -target-language pt
lrelease -compress -silent cura_qt.ts -qm cura_qt.qm
cp * $build_dir/dist/

# Uranium
cd $build_dir/Uranium-prefix/src/Uranium-build
make translations
make copy-translations
