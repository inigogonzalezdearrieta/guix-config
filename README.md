# Guix configuration files

These are the files required to reproduce my Guix system configuration
on any other machine. It supports an entire operating system
declaration, including desktop applications. However, the package list
and home configuration can also be used to generate a scientific
development environment on any other GNU/Linux operating machine (or
WSL for Windows users).

The goal of this repo is to provide an automatic setup for
reproducible computations in thermophysics, which is why a list of
custom scientific packages is also included in the `thermomat/`
directory.

## How to use the repo

Clone it with git, ideally on your home directory:

> git clone https://github.com/inigogonzalezdearrieta/guix-config.git

### Reproducing the list of packages

The `channels.scm` file is a snapshot of a particular commit on a
repository that you can either pull permanently or temporarily go back
in time to run a particular `<command>`:

> guix pull -C ~/guix-config/channels.scm
> 
> guix time-machine -C ~/guix-config/channels.scm -- shell <command>

At present, channels for non-free and thermophysical software are
available in addition to the official Guix channel.

After pulling a certain version of Guix, you can install the packages
in `manifest.scm` permanently or within a temporary shell as:

> guix package -m ~/guix-config/manifest.scm
> 
> guix shell -m ~/guix-config/manifest.scm

### Manual packages

Manually defined packages can be installed as:

> guix package -f python-ferpy.scm

Packages defined on the `thermomat/` directory (or any other custom
channel) can be tested using:

> guix build -L thermomat/ <package-name>

### Reproducing an environment

Export your channels and package list with the following commands:

> guix describe -f channels
> 
> guix package --export-manifest

Then redirect the info towards any text file with the `>` operator.

## TO-DO

- [ ] Add manifest files for packages imported from PyPI:
    - [X] ferpy, brukeropusreader, ft4ftirs, hairl-fer-py.
    - [ ] spectrochempy.
    - [ ] Non-spectroscopic packages.
- [ ] Contribute those packages to the `guix` or `guix-science` repos.
- [ ] Generate custom manifest files for different programming tasks.
- [X] Generate and test a usable home configuration file.
- [ ] Configure all Emacs packages (ELPA or MELPA) with Guix.
