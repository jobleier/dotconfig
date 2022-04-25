git config --global core.editor "vim -c 'set spell spelllang=en'"
git config --global core.excludesfile "$HOME/.config/git/gitignore"

# use vimdiff for merging
git config --global merge.tool vimdiff

# use vimdiff for diff when using git vimdiff
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.vimdiff difftool

# alias
git config --global alias.ls 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
git config --global alias.ll 'log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative --numstat'
git config --global alias.wdiff 'diff --word-diff=color'
git config --global alias.cdiff 'diff --cached'
git config --global alias.cwdiff 'diff --word-diff=color --cached'
git config --global alias.cd 'checkout'
git config --global alias.find '!git ls-files | grep -i'
git config --global alias.alias '!git config -l | grep alias | cut -c 7-'
