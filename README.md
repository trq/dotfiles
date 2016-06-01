# Install rcm

```
brew tap thoughtbot/formulae
brew install rcm
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
