# Install LLVM-14 and clang-14 from Binary with this,</br>
1. Open `/etc/apt/sources.list` file with sudo</br>
2. Add following for ubuntu-18,</br>
```
# LLVM-14 & CLANG-14 in Ubuntu-18
deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-14 main
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-14 main
```
For Ubuntu-20,</br>
```
# LLVM-14 & CLANG-14 in Ubuntu-20
deb http://apt.llvm.org/focal/ llvm-toolchain-focal-14 main
deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-14 main
```

3. Save the file</br>
4. Run following commands,</br>
```
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt update
sudo apt upgrade
sudo apt-get install clang-14 llvm-14
```
</br>

Might get this error,</br></br>
```
The following packages have unmet dependencies:
 clang-14 : Depends: libclang-cpp14 (>= 1:14.0.6~++20230111091309+f28c006a5895) but it is not going to be installed</br>
           Depends: libgcc-s1 (>= 3.0) but it is not installable</br>
            Depends: libllvm14 but it is not going to be installed
            Depends: libstdc++6 (>= 11) but 8.4.0-1ubuntu1~18.04 is to be installed
            Depends: libclang-common-14-dev (= 1:14.0.6~++20230111091309+f28c006a5895-1~exp1~20230111091340.182) but it is not going to be installed
            Depends: llvm-14-linker-tools (= 1:14.0.6~++20230111091309+f28c006a5895-1~exp1~20230111091340.182) but it is not going to be installed
            Depends: libclang1-14 (= 1:14.0.6~++20230111091309+f28c006a5895-1~exp1~20230111091340.182) but it is not going to be installed
            Recommends: llvm-14-dev but it is not going to be installed
 llvm-14 : Depends: llvm-14-runtime (= 1:14.0.6~++20230111091309+f28c006a5895-1~exp1~20230111091340.182) but it is not going to be installed
           Depends: llvm-14-linker-tools (= 1:14.0.6~++20230111091309+f28c006a5895-1~exp1~20230111091340.182) but it is not going to be installed
           Depends: libgcc-s1 (>= 3.3) but it is not installable
           Depends: libllvm14 but it is not going to be installed
           Depends: libstdc++6 (>= 11) but 8.4.0-1ubuntu1~18.04 is to be installed
           Recommends: llvm-14-dev but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
```

**__Simply run this, this will solve the dependency problem__**</br>
`sudo add-apt-repository ppa:ubuntu-toolchain-r/test`



# For Cross-compilation, 
The following cmd will compile for arm32,
`clang++-14 --target=arm-linux-gnueabihf gcd.cpp -o gcd_arm`

But need these pkgs,
```
sudo apt install gcc-arm-linux-gnueabihf
sudo apt install gcc-multilib-arm-linux-gnueabihf
sudo apt install binutils-arm-linux-gnueabihf
sudo apt install libgcc1-armhf-cross
sudo apt install libsfgcc1-armhf-cross
sudo apt install libstdc++6-armhf-cross
sudo apt install libstdc++6-dev-armhf-cross # but this was not installed
```
#### Got this error while installing libstdc++6-dev
```
Reading state information... Done
E: Unable to locate package libstdc++6-dev-armhf-cross
E: Couldn't find any package by regex 'libstdc++6-dev-armhf-cross'
```
#### Then installed this one for ubuntu-18,</br>
`sudo apt install libstdc++-7-dev-armhf-cross`
#### For Ubuntu-20 it will be different,</br>
`sudo apt install libstdc++-8-dev-armhf-cross`</br>
check here [https://packages.ubuntu.com/search?keywords=dev-armhf-cross](https://packages.ubuntu.com/search?keywords=dev-armhf-cross&searchon=names&suite=focal&section=all)

Now, simple run the command,</br>
`clang++-14 --target=arm-linux-gnueabihf gcd.cpp -o gcd_arm`
</br>

If this doesn't work, then install this pkg,</br>
`sudo apt-get install g++-multilib`


This will work.
