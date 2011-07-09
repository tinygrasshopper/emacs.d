mkdir -p ~/.emacs.d/packages/installed/auto-complete
(cd packages/auto-complete/ && make && make install DIR=~/.emacs.d/packages/installed/auto-complete)
