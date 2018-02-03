
#!/bin/bash

# COMPLETION SETTINGS
# add custom competion for Memacs

fpath=(/home/kraken/Moumoute_Emacs/.zsh_comp $fpath)
#comsys initiaisation
autoload -U compinit
compinit
zstyle ':completion:*' menu select=1

# END

