.PHONY: git_init naterial shared

git_init:
	git submodule init
	git submodule update

shared: git_init
	@echo "Installing shared components..."
	$(MAKE) -C shared
	@echo "Done!"

naterial: shared
	@echo "Installing naterial theme..."
	$(MAKE) -C naterial
	@echo "Done!"
