# Install rcm

```
wget https://thoughtbot.github.io/rcm/debs/rcm_1.3.0-1_all.deb
sha=$(sha256sum rcm_1.3.0-1_all.deb | cut -f1 -d' ')
[ "$sha" = "2e95bbc23da4a0b995ec4757e0920197f4c92357214a65fedaf24274cda6806d" ] && \
sudo dpkg -i rcm_1.3.0-1_all.deb
```

# Install dotfiles

```
mkdir -p src/thoughtbot src/trq
git clone git@github.com:thoughtbot/dotfiles.git src/thooughtbot/dotfiles
git clone git@github.com:trq/dotfiles.git src/trq/dotfiles
```

# Run rcup

```
rcup -d src/trq/dotfiles -d src/trq/dotfiles
```
