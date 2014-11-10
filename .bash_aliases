# Put home bin dir on the path for various Bash scripts
export PATH="$HOME/bin:$PATH"

# Add chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Shortcut for clipper for mac
alias clip="nc localhost 8377"

# Set default editor
export EDITOR=vim

# Include .git-completion.sh
if [ -f ~/.git-completion.sh ]; then
  source ~/.git-completion.sh
fi

# Include .git-prompt.sh
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Truncate to last 2 dirs in prompt
export PROMPT_DIRTRIM=2

# Setup current state of git in prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

# Allow toggling to a short prompt
prompt_on() {
  PS1='\u@\h: \w$(__git_ps1) \$ '
}
prompt_off() {
  PS1='\$ '
}
prompt_on

function run-test() {
  if [ ! -p .test-commands ]; then
    mkfifo .test-commands
  fi
  while true; do
    sh -c "$(cat .test-commands)"
  done
}
