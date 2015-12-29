# dotfiles

My basic Unix/Linux home directory environment.

Note, these files start with an underscore (_) instead of a dot (.).  There
is a makefile provided that will update the dot files in your home directory
with these.  When setting up a new account, just check out this repo and
then run "make".

Also note, any passwords/phrases/keys/etc. in these files have been replaced
with tokens managed by the "dot_secrets" script in the bin/scripts/ directory.
dot_secrets depends on two config files, one, dot.yaml, in this directory,
contains the list of mappings where "secret" keys need to be replaced with
tokens.  The other is a NDBM key-value store that I typically keep in my
Dropbox directory.  This is where the actual keys and their matching tokens
are stored.

Using dot_secrets requires a little setup within the repo, also... you have
to add some filter commands:
```sh
    git config filter.secrets.clean=dot_secrets clean %f
    git config filter.secrets.smudge=dot_secrets smudge %f
    git config filter.secrets.required=true


and you will need to add the attributes to the files that you want to
filter (see the .gitattributes file for my usage).
