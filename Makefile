# makefile to automatically install dot files.  it makes a (minor)
# attempt to avoid clobbering any local changes, but no guarantees.
# use "make force" if you _want_ to clobber them.

default:
	./update_dot_files
	./update_dirs

force:
	./update_dot_files -f
	./update_dirs

