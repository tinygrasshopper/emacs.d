git submodule init
git submodule update

(cd packages/rinari && git submodule init && git submodule update)

curl -L0 http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz | tar -xvz
mv color-theme-6.6.0 packages/color-theme

rm -rf ~/.emacs.d/packages/auto-complete
mkdir -p packages/auto-complete
(cd src-packages/auto-complete/ && make && make install DIR=~/.emacs.d/packages/auto-complete) > /dev/null
