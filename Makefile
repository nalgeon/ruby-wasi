.PHONY: build prepare

TAG = ruby%2F3.2.2%2B20230714-11be424
VERSION = 3.2.2

build:
	rm -rf dist
	mkdir -p dist
	curl -L -o dist/ruby-slim.wasm "https://github.com/vmware-labs/webassembly-language-runtimes/releases/download/$(TAG)/ruby-$(VERSION)-slim.wasm"
	curl -L -o dist/ruby.wasm "https://github.com/vmware-labs/webassembly-language-runtimes/releases/download/$(TAG)/ruby-$(VERSION).wasm"
	node_modules/.bin/esbuild src/index.js --minify --target=es2021 --format=esm --outfile=dist/index.js

prepare:
	npm install
