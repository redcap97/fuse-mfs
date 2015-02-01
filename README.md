# fuse-mfs

fuse-mfs is FUSE-based Minix3 Filesystem.

## Usage

### mount

```
fuse-mfs /path/to/image_file /path/to/mountpoint/
```

### umount

```
fusermount -u /path/to/mountpoint/
```

### mkfs

```
mkfs.mfs /path/to/image_file
```

### fsck

```
fsck.mfs /path/to/image_file
```

## Build Prerequisites

### Ubuntu 14.04

```
apt-get install build-essential pkg-config libfuse-dev
```

### Arch Linux

```
pacman -S --needed base-devel fuse
```

## Build and Install

```
make
make install # or make install PREFIX=/usr
```

## Implementation

fuse-mfs is implemented using the Minix3 source code.
Minix3 is a Unix-like operating system.

http://www.minix3.org/

## License

fuse-mfs is distributed under the BSD License.
See LICENSE file.
