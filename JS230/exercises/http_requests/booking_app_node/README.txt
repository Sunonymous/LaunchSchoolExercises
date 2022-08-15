To prevent uploading the application itself, I have removed all app_specific files and left only the exercise files.
Should the application need run again, it will need to once again be downloaded from the LS website.

Also, for posterity I'll note here that I had trouble running NVM on this Arch distro. I was only able to get it working by switching the shell to bash and running the following commands:

Run these commands in Bash if nvm stops working.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
