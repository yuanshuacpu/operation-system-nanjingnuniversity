# NAME := kernel
# SRCS := kernel.c
# export MODULE  := L0
# # export AM_HOME := $(PWD)/../abstract-machine
# ifeq ($(ARCH),)
# export ARCH := x86_64-qemu
# endif

# include $(AM_HOME)/Makefile
# include ../oslabs.mk
# image: git

export ARCH := x86_64-qemu

NAME = kernel
SRCS = kernel.c
LIBS += klib

include $(AM_HOME)/Makefile

