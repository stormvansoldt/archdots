# Automated Dotfile Deployment

God I love customizing stuff. I also love automating stuff, so making a repo that automates my customizations makes me harder than seeing Kate Upton in the Wolf of Wall Street movie. 

This deployment package is designed to be quick, easy, modular, and sexy as hell.


## Installation

Installing my personal abominations is easy as hell:

1. Log in to your favorite {Debian,Arch}-based linux machine (or least-favorite, idgaf)
    - I haven't tested anything other than Arch and Debian so good luck -BSD users!
2. `cd $HOME && git clone https://github.com/stormvansoldt/archdots && cd archdots`
    - `setup.sh` expects you to clone the repo directly to your home directory. If you don't, you'll probably break it
3. `chmod +x setup.sh`

**NOTE: THE NEXT STEP WILL OVERWRITE YOUR DOTFILES. BACK THEM UP IF YOU GIVE A SHIT.**

4. If you want to install all of the dotfiles, simply run `./setup.sh -add`
    - You can also choose to install specific packages by listing them separately after the `-add` flag:
    `./setup.sh -add bash vim`
5. Confirm any dotfiles it asks you to overwrite.
6. You will need to `source` any of the files you want applied (ie. `source ~/.bashrc`). If you installed multiple/all of the programs, it's easier to just log out and log back in again
7. Enjoy my shitty configurations!
