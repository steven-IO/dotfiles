#Make sure bashrc is used.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

#Make vim default system editor
export VISUAL=vim
export EDITOR="$VISUAL"
