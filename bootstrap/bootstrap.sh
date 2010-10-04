echo "Ensuring we have the latest version of sliceconfig installed"
echo "Run started `date`" >> ~/.sliceconfig.bootstrap.log 2>&1
which ruby >> ~/.sliceconfig.bootstrap.log 2>&1
which gem  >> ~/.sliceconfig.bootstrap.log 2>&1

sudo gem uninstall sliceconfig-rb -aIx              >> ~/.sliceconfig.bootstrap.log 2>&1
sudo gem install   sliceconfig-rb --no-rdoc --no-ri >> ~/.sliceconfig.bootstrap.log 2>&1

echo "Sliceconfig installed successfully"

hash -r
sliceconfig
if [ "$?" -eq "0" ]; then
  if [ -d ~/.sliceconfig ]; then
    mv ~/.sliceconfig.bootstrap.log ~/.sliceconfig
  fi
  source ~/.sliceconfig.profile
  hash -r
else
  cat ~/.sliceconfig.bootstrap.log
  echo ""
  echo "Something went wonky with the install. :("
fi
