default: all

build:
    haxe build.hxml
    sed -i 's/(function ($global) {/await(async function ($global) {/g;s/haxeburner_M.main();/await haxeburner_M.asyncMain();/g' bin/x.js

minify: build
    npx uglifyjs bin/x.js -o bin/x2.js

bitburnerise: minify build
    echo "export async function main(ns){$(cat bin/x2.js)}" > bin/x3.js

all: bitburnerise minify build