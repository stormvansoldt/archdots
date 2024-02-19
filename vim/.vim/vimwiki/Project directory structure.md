# Directory Structure Templates

This template should help out when creating/working with various development projects in an effort to keep things consistent across environments.

## Home Directory Structure

$HOME

* /bin/ - Binaries and scripts that I have created or modified
* /src/ - Contains projects that I am currently developing

### Systemwide Project Cheat Sheet

* /usr/bin - Binaries installed by the distro/OS (ie. from a package manager).
* /usr/local - To be used by the admin for installing third-party applications.
   /bin/ - Binaries from self-compiled programs done by the admin.
   /src/ - Source code of self-compiled applications.

### Sample Project Structure

$HOME/dev/
        /my-prog/
            /src/
                /include/
                        /my-prog.h
                        /my-prog.cpp
                /build-debug/
                            /src/
                                /my-prog
                /build-release/
                            /src/
                                /my-prog
        /Makefile
