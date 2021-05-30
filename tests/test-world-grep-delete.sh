#!/bin/bash

# Checking for test directories
if [ ! -d tmp ]; then
	mkdir ./tmp
fi

if [ ! -d tmp/world ]; then
	mkdir -p tmp/world
fi

if [ ! -d tmp/world_nether ]; then
	mkdir -p tmp/world_nether
fi

if [ ! -d tmp/world_the_end ]; then
	mkdir -p tmp/world_the_end
fi

if [ ! -d tmp/backups ]; then
	mkdir -p tmp/backups
fi

# Create test files
head -c 125000 < /dev/urandom > ./tmp/world/myfile
head -c 125000 < /dev/urandom > ./tmp/world_nether/myfile
head -c 125000 < /dev/urandom > ./tmp/world_the_end/myfile

# Looping overa a test cycle
for i in {0..10}
do
	ls -lr tmp/backups/

	./backup.sh -q -m 3 
	    -i tmp/world \
	    -i tmp/world_nether \
	    -i tmp/world_the_end \
	    -o tmp/backups \
	    -o tmp/backups \
	    -o tmp/backups

	sleep 1
done
