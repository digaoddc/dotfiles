alias lg="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias spec="bundle exec rspec spec"
alias gc="git clean -d -f"
alias lw="cd devel/"
alias rc="rails c"
alias bi="bundle install"
alias gd="git diff"
alias gpo="git push origin $(git rev-parse --abbrev-ref HEAD)"

# Squash
#git rebase -i HEAD~3
