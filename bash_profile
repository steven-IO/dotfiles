#Make sure bashrc is used.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs


export M2_HOME=/usr/local/apache-maven
export M2=$M2_HOME/bin

#PATH=$M2:$PATH

#PATH=$PATH:~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/usr/local/apache-maven/bin:/usr/local/apache-maven/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

#PATH=$PATH:~/bin:~/.local/bin

#export PATH

#PATH=$PATH:~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:/usr/local/apache-maven/bin:/usr/local/apache-maven/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/bin:~/.local/bin

#Make vim default system editor
export VISUAL=vim
export EDITOR="$VISUAL"
