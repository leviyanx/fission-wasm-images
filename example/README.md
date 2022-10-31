# WebAssembly Environement Example 

## Usage

### hello.wasm

deploy and run function from single webassembly file

```bash
# create the environment 
$ fission environment create --name wasm --image leviyanx/wasm-env:v1.6

poolsize setting default to 3
environment 'wasm' created

# create function
$ fission function create --name hello-wasm --env wasm --code hello.wasm

Package 'hello-wasm-f50ac152-a849-4079-9dc0-8a8e8edb0a53' created
function 'hello-wasm' created

# run function
$ fission function test --name hello-wasm

hello
```
 
### hello project

compile rust to webassembly, and deploy and run function from package

```bash
# create the environment 
$ fission environment create --name wasm --image leviyanx/wasm-env:v1.6 --builder leviyanx/wasm-builder:v1.30

poolsize setting default to 3
environment 'wasm' created

# create the function
$ cd rust-code
$ fission function create --name hello-wasm --env wasm --src hello

Package 'hello-wasm-d8770ae6-38bb-4d13-974e-cd27ca67a27b' created
function 'hello-wasm' created

# view the building status
fission pkg list
NAME                                            BUILD_STATUS ENV  LASTUPDATEDAT
hello-wasm-d8770ae6-38bb-4d13-974e-cd27ca67a27b succeeded    wasm 31 Oct 22 22:44 CST

# view the building log
fission pkg info --name hello-wasm-d8770ae6-38bb-4d13-974e-cd27ca67a27b                                               

Name:        hello-wasm-d8770ae6-38bb-4d13-974e-cd27ca67a27b
Environment: wasm
Status:      succeeded
Build Logs:
start building
...
/usr/local/bin/build: 19: [: missing ]
   Compiling hello v0.1.0 (/packages/hello-wasm-d8770ae6-38bb-4d13-974e-cd27ca67a27b-tlx4oa/hello)
<jemalloc>: MADV_DONTNEED does not work (memset will be used instead)
<jemalloc>: (This is the expected behaviour if you are running under QEMU)
    Finished dev [unoptimized + debuginfo] target(s) in 6.69s
...

# run the function
fission function test --name hello-wasm

hello
```