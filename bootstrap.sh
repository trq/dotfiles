#!/usr/bin/env bash

#
# Brew and Brew Cask
#
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew.util.install.brew() {
    brew install "${@}" 2> /dev/null
}

brew.util.install.cask() {
    brew cask install "${@}" 2> /dev/null
}

brew.init() {
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew tap homebrew/dupes
    brew tap josegonzalez/homebrew-php

    brew tap phinze/homebrew-cask
    brew.util.install.brew brew-cask
}

brew.upgrade() {
    brew update && brew upgrade
}

brew.install() {
    for pkg in `cat brew.txt`; do
        brew.util.install.brew "$pkg"
    done

    for pkg in `cat brew-cask.txt`; do
        brew.util.install.cask "$pkg"
    done
}

#
# Ruby and Gems
#
ruby.install() {
    curl -L https://get.rvm.io | bash -s stable --ruby
    rvm install 1.9.3
    rvm --default use 1.9.3

    # To update gem
    #gem update --system
}

#
# Python and Pip
#
python.install() {
    brew.util.install.brew python

    # Upgrade pip and setuptools
    #pip install --upgrade pip
    #pip install --upgrade setuptools
}

#
# Node
#
node.install() {
    brew.util.install.brew node
    curl https://npmjs.org/install.sh | sh
    npm install grunt

    # To update npm
    #npm install npm -g
}

#
# PHP
#
php.install() {
    brew.util.install.brew php55
    brew.util.install.brew php55-intl
    brew.util.install.brew php55-mcrypt
    brew.util.install.brew php55-xdebug

    curl -sS https://getcomposer.org/installer | php -- --install-dir=bin

    # Currently broken due to requiring minimum stability of dev.
    #composer global require 'rhumsaa/jenkins-php=~1.2
}

brew.init
brew.upgrade
brew.install

ruby.install
python.install
node.install
php.install
