.PHONY: git_init drwhite shared

git_init:
	git submodule init
	git submodule update

shared: git_init
	@echo "Installing shared components..."
	$(MAKE) -C shared
	@echo "Done!"

drwhite: shared
	@echo "Installing drwhite theme..."
	$(MAKE) -C drwhite
	@echo "Done!"
