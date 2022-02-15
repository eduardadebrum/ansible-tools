
echo "============= INSTALLING XCODE ==============="

xcode-select --install
sudo xcodebuild -license accept

if hash python; then
    echo " ============= INSTALLING PYTHON =============="
    /bin/bash -c "$(curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py)"
    python get-pip.py --user


else
   echo "Do you want to update the python version? (y): "
   read VAR

   if [[ $VAR == "y" ]]; then
      echo " ============= UPDATING PYTHON =============="
    #sudo pip install --upgrade pip
   fi
fi


if ! hash ansible; then
    echo " ============= INSTALLING ANSIBLE =============="
    sudo python get-pip.py
    sudo python -m pip install ansible
fi

echo "============= RUNNING ANSIBLE PLAYBOOK   =============="
# TODO 
# ansible-playbook install.yml

