# Tar GZip Archive Bundles


**Creating a tar archive**
```
tar -cvzf tarballname.tar.gz itemtocompress
```
For example, to compress a directories jpg files only, you’d type:

```
tar -cvzf jpegarchive.tar.gz /path/to/images/*.jpg

```

The * is a wildcard here, meaning anything with a .jpg extension will be compressed into the jpegarchive.tar.gz file and nothing else.

_The resulting .tar.gz file is actually the product of two different things, tar basically just packages a group of files into a single file bundle but doesn’t offer compression on it’s own, thus to compress the tar you’ll want to add the highly effective gzip compression. You can run these as two separate commands if you really want to, but there isn’t much need because the tar command offers the -z flag which lets you automatically gzip the tar file._

**Opening .tar.gz Archives**

Unpacking the gz and tar files can be done with applications like Pacifist or Unarchiver (free), or by going back to the command line with:
```
gunzip filename.tar.gz

```
Followed by:
```
tar -xvf filename.tar
```

Generally you should untar things into a directory, or the present working directory will be the destination which can get messy quick.
