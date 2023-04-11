
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

#config install
cp -rf Baza/.config/* ~/.config/
