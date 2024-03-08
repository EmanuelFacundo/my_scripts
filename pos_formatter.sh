#!/bin/bash
# ========= BEGIN VARIABLES =========

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_NVM="https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh"
URL_RBENV="https://github.com/rbenv/rbenv.git"
URL_DOCKER_COMPOSE="https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"
URL_VS_CODE="https://az764295.vo.msecnd.net/stable/3b889b090b5ad5793f524b5d1d39fda662b96a2a/code_1.69.2-1658162013_amd64.deb"

DIRECTORY_DOWLOADS="$HOME/Downloads/programs"

PROGRAMS_FOR_INSTALL=(
  snapd
  virtualbox
  flameshot
  build-essential
  git-core
  curl
  docker.io
  libssl-dev
  libreadline-dev
  zlib1g-dev
  autoconf
  bison
  libyaml-dev
  libncurses5-dev
  libffi-dev
  libgdbm-dev
)

# ========= END VARIABLES =========

# ========= BEGIN COMMANDS =========

# update repositories
sudo apt-get update

mkdir $DIRECTORY_DOWLOADS
wget -c $URL_GOOGLE_CHROME -P $DIRECTORY_DOWLOADS
wget -c $URL_VS_CODE -P $DIRECTORY_DOWLOADS

# install all *.deb files
sudo dpkg -i $DIRECTORY_DOWLOADS/*.deb

sudo dpkg --configure -a

for program_name in ${PROGRAMS_FOR_INSTALL[@]}; do
  if ! dpkg -l | grep -q $program_name; then # if program is not installed
    sudo apt install $program_name -y
  else
    echo "Program $program_name is already installed"
  fi
done

# install snap packages
sudo snap install spotify
sudo snap install --classic heroku

# install docker-compose
sudo wget -L $URL_RBENV -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# install nvm
curl $URL_NVM | bash
source ~/.bashrc

# install node
nvm install node
echo "node version: $(node --version)"


# install rbenv
git clone $URL_RBENV $DIRECTORY_DOWLOADS/.rbenv
echo 'export PATH="$DIRECTORY_DOWLOADS/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

# install ruby-build
git clone https://github.com/rbenv/ruby-build.git $DIRECTORY_DOWLOADS/.rbenv/plugins/ruby-build
echo 'export PATH="$DIRECTORY_DOWLOADS/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

# install ruby
rbenv install 3.1.2
rbenv global 3.1.2
echo "ruby version: $(ruby --version)"
