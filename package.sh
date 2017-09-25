#!/bin/bash -e

readonly VE_LOCATION=/tmp/cexec_pkg_ve

init_ve() {
  virtualenv -p /usr/bin/python $VE_LOCATION
  source $VE_LOCATION/bin/activate
  pip install pyinstaller
  pip install -r requirements.txt
}

package() {
  local arch=$(uname -m)
  sudo rm -r dist/$arch/linux || true
  pyinstaller --distpath dist/$arch/linux --clean --hidden-import=requests main.py
  if [ "$arch" == "x86_64" ]; then
    sudo rm -r dist/main || true
    mkdir -p dist/main
    sudo cp -rf dist/$arch/linux/main/. dist/main/
  fi
}

main() {
  init_ve
  package
}

main

