# My personal dotfiles.

## Vim

Create a symbolic link from the vimrc file within the root of the repo to
~/.vimrc and another from the vim directory within the repo root to ~/.vim.

All plugins are maintained as git submodules.

### Installation

```
git submodule add https://someurl.com/somerepo vim/bundle/somerepo
git submodule init && git submodule update
```

### Updating

```
git submodule foreach git pull origin master
```

### Removal

* Remove it from .gitmodules
* Remove it from .git/config
* Run git rm --cached <path-to-module></path-to-module>
