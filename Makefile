init-modules:
	git submodule init && git submodule update

update-modules:
	git submodule foreach git pull origin master
