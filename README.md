# Houdini-NvFlex
simple integration of Nvidia Flex technology into SideFX Houdini

[see animated preview here](https://i.imgur.com/rKzsk49.gifv)

![preview](https://i.imgur.com/rKzsk49.gif)

## installation (Windows and Linux):
* copy the file [nvFlex.json](package\NvFlexDop\nvFlex.json) into your packages folder **C:\Users\\\<YOUR USER\>\Documents\houdiniX.X\packages\\**
* adjust the "NV_FLEX" variable correctly to point to where you downloaded the [NvFlexDop](package\NvFlexDop) folder.
* **Linux Note** These so were compiled with gcc 6.3.0, glibc 2.24-11.

## Building:

### Windows:
* Make sure you have Cmake and its on the PATH
* Make sure you have some Cuda toolkit
* Make sure to have a compiler, I'm working with "Visual Studio 16 2019"
* Edit the **HOUDINI_PATH** and **NVFLEX_DIR** variables in [windowsbuild.bat](windowsbuild.bat) to match your dev environment
* Launch [windowsbuild.bat](windowsbuild.bat)

### Linux:
* if you want to compile it yourself:
  * edit **linux_build_16X.sh** so the helper variables point to the locations of the libraries it requires
  * launch **linux_build_16X.sh** and if you have all dependencies - build will succeed, and your new so will be put into **package/NvFlexDop/dso/linux64** folder
  * note: depending on your linux distribution you might require different packages. You might also require full Cuda Toolkit **8.0.44** to be able to build, in this case you will have to add paths to your Cuda toolkit to the Makefile. Although some distributions, like debian, have core libs from that toolkit available in reps, so for example for debian - package nvidia-cuda-dev will be enough and you don't have to download full Cuda Toolkit and set any paths manually.

That should do it.

## Examples

please, see hip files in [examples](package\NvFlexDop\examples) folder
