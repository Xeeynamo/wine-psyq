# Wine PSY-Q

Allows to run the PSY-Q toolchain to build PlayStation 1 games from their source code using Docker.

## Usage

Just invoke `docker run --rm -w /work -v ${PWD}:/work xeeynamo/psyq:4.6 wine /app/NAME_OF_THE_TOOL`.

By doing `-w /work -v ${PWD}:/work` you ensure that the tool will have visibility of the current working directory and all its content with read and write access.

You can also easily use it in a `Makefile` by doing the following:

```
PSYQVER := 4.6
PSYQ    := docker run --rm -w /work -v ${PWD}:/work xeeynamo/psyq:$(PSYQVER) wineconsole 
AS      := $(PSYQ) /app/ASPSX.EXE
CC      := $(PSYQ) /app/CC1PSX.EXE

%.o: %c
    $(CC) $(CC_FLAGS) -o $@.s $<
    $(AS) $(AS_FLAGS) -o $@ $@.s
```

Also mount `/app/lib` and `/app/include` to expose your custom PSY-Q libraries.

## Toolchain support

The following versions of PSY-Q are supported:

* PSY-Q 2.6
* PSY-Q 3.0
* PSY-Q 3.3
* PSY-Q 3.5
* PSY-Q 3.6
* PSY-Q 4.0
* PSY-Q 4.1
* PSY-Q 4.3
* PSY-Q 4.6

While the following tools are included within the image:

* ASMPSX
* ASPSX
* CC1PLPSX (starting from 3.6)
* CC1PSX (starting from 3.6)
* CCPSX
* CPLUSPSX (starting from 3.6)
* CPPPSX (starting from 3.6)
* PSYLIB
* PSYLINK
* PSYMAKE

PSY-Q up to version 3.6 uses compilers built for MS-DOS. Therefore the toolchain behaviour will differenciate compared to PSY-Q 4.x.

## Why?

PSY-Q is an ancient toolchain built around 1996 and it was created to run on the 32-bit versions of Windows (eg. Windows 95 and Windows NT 4.0).
As we are moving in a cross-platform world, me and other people needs a solution where the toolchain can run on Linux and GitHub Actions, without bothering to install Wine.
By providing a Docker Image with the various versions of PSY-Q inside, it will be possible to run the toolchain within seconds and without any set-up involved. Including on the modern versions of Windows.

## Thanks

Thanks to [mkst](https://github.com/mkst) to providing me the tools and to give me insights on how to use the PSY-Q toolchain.
