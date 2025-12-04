# crypto-buildsystem-Makefile
Modular C project using Makefiles to build two cryptographic modules: a static Caesar cipher library and a dynamic XOR cipher library. The build system auto-generates directories for objects, libraries, and the final executable, keeping the project organized and demonstrating custom build automation.

Project/
├── Application/
│   ├── app.c
│   └── Makefile          # main Makefile that calls the module makefiles
│
├── caesar_cipher/
│   ├── src/
│   │   ├── caesar_encrypt.c
│   │   └── caesar_decrypt.c
│   ├── inc/
│   │   └── caesar_cipher.h
│   └── caesar_cipher.mk  # builds static library libcaesar.a
│
├── xor_cipher/
│   ├── src/
│   │   ├── xor_encrypt.c
│   │   └── xor_decrypt.c
│   ├── inc/
│   │   └── xor_cipher.h
│   └── xor_cipher.mk     # builds dynamic library libxor.so
│
├── gen/                  # generated object files (created by Make)
├── libs/                 # generated libraries (static + dynamic)
└── out/                  # final executable "output"
