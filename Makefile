# makefile to automatically install dot files.  it makes a (minor)
# attempt to avoid clobbering any local changes, but no guarantees.
# use "make force" if you _want_ to clobber them.  "make import"
# will pull local changes back to the git working directory.

default:
	./update_dot_files
	./update_dirs

help:
	@echo "usage: make        - update dot files if older than the repo"
	@echo "       make force  - update dot files even if newer than the repo"
	@echo "       make diff   - diffs between the repo and existing files"
	@echo "       make import - update the repo from the dot files"

force:
	./update_dot_files -f
	./update_dirs

diff:
	@(./update_dot_files -t; ./update_dirs -t) | grep local_mod | \
	while read key file; do \
	  sfile=`echo $$file | sed -e 's/^_/./'`; \
	  sfile="$$HOME/$$sfile"; \
          echo diff $$file $$sfile; \
	  diff $$file $$sfile; \
	done; \
	exit 0


import:
	@(./update_dot_files -t; ./update_dirs -t) | grep local_mod | \
	while read key file; do \
	  sfile=`echo $$file | sed -e 's/^_/./'`; \
	  sfile="$$HOME/$$sfile"; \
	  echo "copying $$sfile over $$file"; \
	  cp $$sfile $$file; \
	done
