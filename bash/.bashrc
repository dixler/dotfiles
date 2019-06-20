# .bashrc
export PATH="$PATH:$HOME/.bin"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH
alias pretty='python -m json.tool'
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kdixler/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/kdixler/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kdixler/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/kdixler/Downloads/google-cloud-sdk/completion.bash.inc'; fi
