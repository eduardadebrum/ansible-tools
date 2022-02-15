
echo "============= INSTALLING XCODE ==============="

xcode-select --install
sudo xcodebuild -license accept

echo "============= INSTALLING ANSIBLE =============="

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible

echo "============= RUNNING ANSIBLE    =============="
# TODO 
ansible-playbook install.yml

