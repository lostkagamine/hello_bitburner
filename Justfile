default: all

build:
    haxe build.hxml

minify: build
    npx uglifyjs bin/x.js -o bin/x2.js

bitburnerise: minify build
    echo "export async function main(ns){$(cat bin/x2.js)}" > bin/x3.js

all: bitburnerise minify build