# Ruby WASI build

This is a [WASI](https://wasi.dev/) build of the Ruby 3.2 interpreter compiled by [VMware Labs](https://github.com/vmware-labs/webassembly-language-runtimes).

It is published as an NPM package [@antonz/ruby-wasi](https://www.npmjs.com/package/@antonz/ruby-wasi):

```
https://unpkg.com/@antonz/ruby-wasi/dist/ruby.wasm
https://unpkg.com/@antonz/ruby-wasi/dist/ruby-slim.wasm
```

## Usage

Using the [Runno](https://github.com/nalgeon/runno) runtime:

```js
import { WASI } from "https://unpkg.com/@antonz/runno/dist/runno.mjs";

const url = "https://unpkg.com/@antonz/ruby-wasi/dist/ruby.wasm";
const result = await WASI.start(fetch(url), {
    args: ["ruby", "--version"],
    stdout: (out) => console.log(out),
    stderr: (err) => console.error(err),
});
console.log(`exit code = ${result.exitCode}`);
```

Result:

```
ruby 3.2.2 (2023-03-30 revision e51014f9c0) [wasm32-wasi]
exit code = 0
```

## Building from source

```
make prepare
make build
```

## License

Copyright 2023 [VMware Labs](https://github.com/vmware-labs/webassembly-language-runtimes), Apache-2.0 license.

Ruby is copyrighted by [Yukihiro Matsumoto](https://www.ruby-lang.org/en/about/license.txt), 2-Clause BSD License.
