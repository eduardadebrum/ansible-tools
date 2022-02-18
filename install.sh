CURRENT_DIRECTORY=$HOME

# TODO I want to change the way to download ansible. Brew is being installed by ansible.
installBrew() {
    if ! hash brew; then
        echo " ============= INSTALLING BREW =============="
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

installAnsible() {
    if ! hash ansible; then
        echo " ============= INSTALLING ANSIBLE =============="
        brew install ansible
    fi
}

runAnsiblePlaybook() {
    echo "============= RUNNING ANSIBLE    =============="
    # TODO
    ansible-playbook -v install.yml
}

# ========== Main Script
installXcode
installBrew
installAnsible
runAnsiblePlaybook
