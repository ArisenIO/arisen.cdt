# ARISEN.CDT (Contract Development Toolkit)
## Version : 1.0.0

ARISEN.CDT is a toolchain for WebAssembly (WASM) and set of tools to facilitate contract writing for the ARISEN platform.  In addition to being a general purpose WebAssembly toolchain, [ARISEN](https://github.com/arisenio/arisen) specific optimizations are available to support building ARISEN smart contracts.  This new toolchain is built around [Clang 7](https://github.com/arisenio/llvm), which means that ARISEN.CDT has the most currently available optimizations and analyses from LLVM, but as the WASM target is still considered experimental, some optimizations are not available or incomplete.

### Attention
ARISEN.CDT Version 1.3.x introduced quite a few breaking changes.  To have binary releases we needed to remove the concept of a core symbol from ARISEN.CDT. This meant drastic changes to symbol, asset and other types/functions that were connected to them. Since these changes would be disruptive, we decided to add as many disruptive changes needed for future contract writing, so that disruption should only occur once. Please read the **_Differences between Version 1.2.x and Version 1.3.x_** section of this readme.

### Binary Releases
ARISEN.CDT currently supports Mac OS X brew, Linux x86_64 Debian packages, and Linux x86_64 RPM packages.

**If you have previously installed ARISEN.CDT, please run the `uninstall` script (it is in the directory where you cloned ARISEN.CDT) before downloading and using the binary releases.**

#### Mac OS X Brew Install
```sh
$ brew tap arisen/arisen.cdt
$ brew install arisen.cdt
```

#### Mac OS X Brew Uninstall
```sh
$ brew remove arisen.cdt
```

#### Debian Package Install
```sh
$ wget https://github.com/arisenio/arisen.cdt/releases/download/v1.6.3/arisen.cdt_1.6.3-1-ubuntu-18.04_amd64.deb
$ sudo apt install ./arisen.cdt_1.6.3-1-ubuntu-18.04_amd64.deb
```

#### Debian Package Uninstall
```sh
$ sudo apt remove arisen.cdt
```

#### RPM Package Install
```sh
$ wget https://github.com/arisenio/arisen.cdt/releases/download/v1.6.3/arisen.cdt-1.6.3-1.el7.x86_64.rpm
$ sudo yum install ./arisen.cdt-1.6.3-1.el7.x86_64.rpm
```

#### RPM Package Uninstall
```sh
$ sudo yum remove arisen.cdt
```

### Guided Installation (Building from Scratch)
```sh
$ git clone --recursive https://github.com/arisenio/arisen.cdt
$ cd arisen.cdt
$ ./build.sh
$ sudo ./install.sh
```

### Installed Tools
---
* arisen-cpp
* arisen-cc
* arisen-ld
* arisen-init
* arisen-abidiff
* arisen-wasm2wast
* arisen-wast2wasm
* arisen-ranlib
* arisen-ar
* arisen-objdump
* arisen-readelf

## Contributing

[Contributing Guide](./CONTRIBUTING.md)

[Code of Conduct](./CONTRIBUTING.md#conduct)

## License

[MIT](./LICENSE)
