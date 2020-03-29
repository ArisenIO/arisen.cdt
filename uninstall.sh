#! /bin/bash

binaries=(arisen-ranlib
          arisen-ar
          arisen-objdump
          arisen-readelf
          arisen-abigen
          arisen-wasm2wast
          arisen-wast2wasm
          arisen-pp
          arisen-cc
          arisen-cpp
          arisen-ld)

if [ -d "/usr/local/arisen.cdt" ]; then
   printf "\tDo you wish to remove this install? (requires sudo)\n"
   select yn in "Yes" "No"; do
      case $yn in
         [Yy]* )
            pushd /usr/local &> /dev/null
            rm -rf arisen.cdt
            pushd bin &> /dev/null
            for binary in ${binaries[@]}; do
               rm ${binary}
            done
            popd &> /dev/null
            pushd lib/cmake &> /dev/null
            rm -rf arisen.cdt
            popd &> /dev/null
            break;;
         [Nn]* ) 
            printf "\tAborting uninstall\n\n"
            exit -1;;
      esac
   done
fi

if [ -d "/usr/local/arisen.wasmsdk" ]; then
   printf "\tDo you wish to remove this install? (requires sudo)\n"
   select yn in "Yes" "No"; do
      case $yn in
         [Yy]* )
            pushd /usr/local &> /dev/null
            rm -rf arisen.wasmsdk
            pushd bin &> /dev/null
            for binary in ${binaries[@]}; do
               rm ${binary}
            done
            popd &> /dev/null
            break;;

         [Nn]* ) 
            printf "\tAborting uninstall\n\n"
            exit -1;;
      esac
   done
fi
