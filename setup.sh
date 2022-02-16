
echo "============= INSTALLING XCODE ==============="

xcode-select --install
sudo xcodebuild -license accept

echo "============= INSTALLING ANSIBLE =============="

if ! hash ansible; then
    echo " ============= INSTALLING ANSIBLE =============="
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install ansible
fi


echo "============= RUNNING ANSIBLE    =============="
# TODO 
ansible-playbook install.yml

