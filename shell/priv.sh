#!/usr/bin/env sh



d=$(realpath $PWD)
chmod -R +r "$HOME/.priv"
chmod -R +r "$HOME/.priv/pictures"
echo "Entering priv mode..."
set HIST_NO_STORE
cd $HOME/.priv
PROMPT='%F{red} %/ PRIV %# ' zsh -f
echo "Exiting priv mode..."
chmod -R -r "$HOME/.priv/"
chmod -R -r "$HOME/.priv/pictures"
cd $d
