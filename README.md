# Guix configuration files

These are the files required to reproduce my Guix environment on any GNU/Linux machine (or WSL).

## How to use the repo

Download it with git or wget:

> git clone https://github.com/inigogonzalezdearrieta/guix-config.git
> 
> wget https://github.com/inigogonzalezdearrieta/guix-config/archive/refs/heads/main.tar.gz && tar -xzf main.tar.gz

The `channels.scm` file is a snapshot of a particular Guix commit that you can either pull permanently or temporarily go back in time to run a particular `<command>`:

> guix pull -C ~/guix-config/channels.scm
> 
> guix time-machine -C ~/guix-config/channels.scm -- shell <command>

Afterwards, you can install the packages in `manifest.scm` permanently or within a temporary shell as:

> guix package -m ~/guix-config/manifest.scm
> 
> guix shell -m ~/guix-config/manifest.scm

Add the following lines to your `.bash_aliases` dotfile to more easily generate updated versions:

> alias exportmanifest='guix package --export-manifest > ~/guix-config/manifest.scm'
> 
> alias exportchannels='guix describe -f channels > ~/guix-config/channels.scm'

## TO-DO

- Add manifest files for packages imported from PyPI: spectrochempy, ferpy, brukeropusreader.
