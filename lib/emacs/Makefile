.SUFFIXES: .el .elc

.el.elc:
	emacs -batch -f batch-byte-compile $*.el

all: *.elc
