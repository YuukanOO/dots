.PHONY: drwhite shared

shared:
	@echo "Installing shared components..."
	$(MAKE) -C shared
	@echo "Done!"

drwhite: shared
	@echo "Installing drwhite theme..."
	$(MAKE) -C drwhite
	@echo "Done!"
