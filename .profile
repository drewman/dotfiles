export SSH_ENV=$HOME/.ssh/environment

function start_ssh_agent {
    echo "Starting new SSH agent..."
    ssh-agent > $SSH_ENV
    echo succeeded
    chmod 600 $SSH_ENV
    source $SSH_ENV > /dev/null
    ssh-add
}

if [ -f "$SSH_ENV" ]; then
    . $SSH_ENV > /dev/null
    ps x | grep "^ *$SSH_AGENT_PID" | grep ssh-agent$ > /dev/null || start_ssh_agent
else
    start_ssh_agent
fi
