#open new horizons
cp -rf sources.list /etc/apt/
apt update
 
# installing packages from 'packages' file
apt-get install $(grep -vE "^\s*#" packages  | tr "\n" " ")

#installing micro
curl https://getmic.ro | bash
mv micro /usr/bin

#ly
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
make install installsystemd
systemctl enable ly.service
cd ../
rm -rf ly

# add kali-linux repository's and other(open new horizons 2)
echo ""
wget 'https://archive.kali.org/archive-key.asc'
apt-key add archive-key.asc
apt update
apt install betterlockscreen
cp -rf sources.list.d ../../../etc/apt/

#config install
cp -rf Baza/.config/* ~/.config/
