# Ruby assignment, the Project

This project is an solution to assignment given as part of applying to job for java developer.
Please have on mind, that author have no prior knowledge of ruby and so take code in this repo with precaution.

## Running program

Make sure, that you have all required gems installed (optparse, digest and colorize), than you can make example work issuing these commands:
```shell
cd bin
ruby console.rb --help
```

When running without any options, sample data directory gets scanned for text file duplicates.

## Preparing sample collision

I have used `git clone https://github.com/corkami/collisions` command to get repo with scripts and than I have used `png.py pic1.png pic2.png` to generate some MD5 colliding files.

## Assignment

Implement a script in Ruby language that will search the given directory and its subdirectories for duplicate files.
* the script will be controlled from the command line,
* input will be a root directory and a file mask,
* the script will collect all files in the given path, matching the file mask,
* for each file collected it will calculate MD5 sum,
* the files with the same MD5 will be extracted to groups and compared byte-to-byte,
* script will print out duplicates, starting with MD5 and list of files in each duplicate group.

