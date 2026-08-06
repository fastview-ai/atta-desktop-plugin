# Developer helpers for the Atta Desktop plugin.
#
# Cursor rejects a local plugin whose directory is a symlink pointing outside
# ~/.cursor/plugins/local, so a local install must be a real copy. Re-run
# `make install-local` after editing the plugin, then reload Cursor if it does
# not pick up the change automatically.

CURSOR_LOCAL := $(HOME)/.cursor/plugins/local/atta-desktop

.PHONY: install-local uninstall-local

install-local:
	rsync -a --delete --exclude '.git' ./ "$(CURSOR_LOCAL)/"
	@echo "Installed to $(CURSOR_LOCAL)"
	@echo "If Cursor does not auto-refresh, run 'Developer: Reload Window'."

uninstall-local:
	rm -rf "$(CURSOR_LOCAL)"
	@echo "Removed $(CURSOR_LOCAL)"
