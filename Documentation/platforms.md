# Platforms

Platforms can be treated as special [packages](./packages.md). The platform
is installed as the last package, meaning it can be used to override files
installed by any previous package. The platform can also define a list of
packages that shall not be installed (see binary.mk).
