function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>$1
}

su vagrant << EOF

echo installing Watchman
install automake
install autoconf
git clone https://github.com/facebook/watchman.git /home/vagrant/watchman >/dev/null 2>&1
cd /home/vagrant/watchman
./autogen.sh >/dev/null 2>&1
./configure >/dev/null 2>&1
make >/dev/null 2>&1
make install >/dev/null 2>&1

install 'ExecJS runtime' nodejs
ln -s /usr/bin/nodejs /usr/bin/node

install NPM npm

npm cache clean -f >/dev/null 2>&1
npm install -g n >/dev/null 2>&1
n stable >/dev/null 2>&1

add-apt-repository ppa:nginx/stable
apt-get update
install NGINX nginx

echo installing Ember-CLI
npm install -g ember-cli >/dev/null 2>&1
npm install -g bower >/dev/null 2>&1
npm install -g phantomjs >/dev/null 2>&1

EOF
