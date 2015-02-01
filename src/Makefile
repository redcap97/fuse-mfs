CFLAGS  = $(shell pkg-config fuse --cflags) -O2 -MD -MP
LDFLAGS = $(shell pkg-config fuse --libs)

TARGET = fuse-mfs
OBJS   = cache.o inode.o main.o mount.o path.o read.o stats.o table.o utility.o \
         glue.o link.o misc.o open.o protect.o stadir.o super.o time.o write.o

include ../build.mak
