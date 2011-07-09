mkdir -p packages/auto-complete
(cd src-packages/auto-complete/ && make && make install DIR=~/.emacs.d/packages/auto-complete)
