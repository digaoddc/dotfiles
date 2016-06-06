export PS1='[ \[\e[1;34m\]\u\[\e[0;31m\]@\[\e[1;32m\]\h \[\e[1;36m\]\w \[\e[0;33m\]] \[\e[1;31m\]`git branch 2> /dev/null | grep \* | head -1 |  sed "s/\* //g" | awk "{ print \"(\" \\\$1 \")\" }"`\[\033[29m\] $\[\e[0;33m\]'

alias lg="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
#alias ll="log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat"

alias spec="bundle exec rspec spec"
alias mysql-start="mysql.server start"
alias mysql-stop="mysql.server stop"
alias gc="git clean -d -f"
alias gs="git status"
alias tailtest="tail -f log/development.log"
