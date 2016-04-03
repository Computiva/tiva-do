#! /bin/bash

mkdir -p build/static
for filename in src/*.haml
do
	haml "$filename" > "build/static/`basename $filename`.html"
done
for filename in src/*.sass
do
	sass "$filename" > "build/static/`basename $filename`.css"
done
for filename in src/*.coffee
do
	coffee --output ./build/static --compile $filename
done
