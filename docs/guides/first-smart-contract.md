### Building your first smart contract
```c++
#include <arisen/arisen.hpp>
#include <arisen/name.hpp>

class [[arisen::contract]] hello : public arisen::contract {
   public:
      using arisen::contract::contract;

      [[arisen::action]]
      void hi(arisen::name nm) {
         arisen::print_f("Hello, %\n", nm);
      }
};
```

- Navigate to the hello folder in examples (./examples/hello).
- You should then see the hello.cpp file
- Now run the compiler
```sh
$ arisen-cpp -abigen hello.cpp -o hello.wasm
```
- Or with CMake
```sh
$ mkdir build
$ cd build
$ cmake ..
$ make
```
This will generate two files:
* The compiled binary wasm (hello.wasm)
* The generated ABI file (hello.abi)
