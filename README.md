# container-kmonad
- This is used to build: https://github.com/kmonad/kmonad/blob/master/doc/installation.md#using-docker
which will let us pull in the binary
- https://quay.io/repository/bradfordwagner/kmonad?tab=tags
- upstream image only allows amd64

## Building
- task build_local
- copy binary to this directory
    - it will be something like this: /private/tmp/kmonad/.stack-work/install/aarch64-osx/915182978f9c0acea6e0db3b870f086bed969553ee5d50b5aae74b5ba87fb948/9.4.8/bin/kmonad
- task docker

## Installing
- task install_dext
- task dext_activate copy_latest_binary

