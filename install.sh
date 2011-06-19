if [-d "tmp"]; then
  mkdir tmp
fi


wget http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.zip -O tmp/color-theme-6.6.0.zip
unzip tmp/color-theme-6.6.0.zip -d packages/external/
rm tmp/color-theme-6.6.0.zip