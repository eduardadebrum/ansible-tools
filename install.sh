CURRENT_DIRECTORY=$HOME

installXcode() {
    echo "============= INSTALLING XCODE ==============="
    xcode-select --install
    sudo xcodebuild -license accept
}

downloadRepository() {
    echo "============= Downloading Project ==============="
    cd $CURRENT_DIRECTORY
    "$(curl https://github.com/eduardadebrum/ansible-tools/archive/refs/heads/main.zip -L -o ansible-tools-main.zip)"
    unzip ansible-tools-main.zip
    rm ansible-tools-main.zip
    cd ansible-tools-main
}

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

echo "Would you like to install the complete project (y/n)?"
read confirm_istall

if [[ $confirm_istall =~ ^[Yy]$ ]]; then 
    echo "Starting installation"
    downloadRepository
    installBrew
    installAnsible
    runAnsiblePlaybook
elif [[ $confirm_istall =~ ^[Nn]$ ]]; then
    echo "Just downloading the project"
    downloadRepository
else 
    echo "Skip Installation"
    exit 1
fi