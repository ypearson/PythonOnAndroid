#!/bin/sh

set -x
A="/home/ypearson/Dragonboad410c/aosp"
SYSROOT="--sysroot $A/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/lib/gcc/arm-linux-androideabi/4.9.x-google"

PREFIX="$A/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi"

CC=$PREFIX-gcc
CXX=$PREFIX-g++
LD=$PREFIX-ld
AR=$PREFIX-ar
RANLIB=$PREFIX-ranlib

CFLAGS=-c
CXXFLAGS = "$CFLAGS"

LDFLAGS="-Wl,--allow-shlib-undefined"
#CFLAGS="-mandroid -fomit-frame-pointer --sysroot $ANDROID_NDK/platforms/android-5/arch-arm"
CFLAGS="-mandroid -fomit-frame-pointer $SYSROOT"

$CC $CFLAGS -c test.c

./configure LDFLAGS="" CFLAGS="-mandroid -fomit-frame-pointer $SYSROOT -c" --enable-shared --host=arm-linux --build=x86_64-unknown-linux-gnu --without-gcc

