# Guix configuration files

These are the files required to reproduce my Guix environment on any
GNU/Linux machine (or WSL). The list of packages contains mostly
scientific software and command-line utilities, not desktop apps. I
recommend using Guix only as a package manager, not as a full
operating system.

## How to use the repo

Clone it with git, ideally on your home directory:

> git clone https://github.com/inigogonzalezdearrieta/guix-config.git

### Reproducing the list of packages

The `channels.scm` file is a snapshot of a particular Guix commit that
you can either pull permanently or temporarily go back in time to run
a particular `<command>`:

> guix pull -C ~/guix-config/channels.scm
> 
> guix time-machine -C ~/guix-config/channels.scm -- shell <command>

After pulling a certain version of Guix, you can install the packages
in `manifest.scm` permanently or within a temporary shell as:

> guix package -m ~/guix-config/manifest.scm
> 
> guix shell -m ~/guix-config/manifest.scm

### Manual packages

Manually defined packages can be installed as:

> guix package -f python-ferpy.scm

### Generating updated versions

Add the following lines to your `.bash_aliases` dotfile to more easily generate updated versions:

> alias exportmanifest='guix package --export-manifest > ~/guix-config/manifest.scm'
> 
> alias exportchannels='guix describe -f channels > ~/guix-config/channels.scm'


## TO-DO

- [ ] Add manifest files for packages imported from PyPI:
    - [X] ferpy, brukeropusreader.
    - [ ] spectrochempy, ft4ftir.
- [ ] Contribute those packages to the `guix` or `guix-science` repos.
- [ ] Generate custom manifest files for different programming tasks.
- [ ] Generate and test a usable home configuration file.
- [ ] Configure all Emacs packages (ELPA or MELPA) with Guix.
