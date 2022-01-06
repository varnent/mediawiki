#!/usr/bin/env sh
# Syncs the whole git repo in the correct way
# This is probably the file that you want to run..

BASEDIR=$(cd `dirname "$0"` && pwd)

cd $BASEDIR

Help()
{
   # Display Help
   echo "Syntax: sync.sh [-h|u]"
   echo "options:"
   echo "u     Composer update, as well as Composer install"
   echo "h     Print this Help."
   echo
   echo "Examples:"
   echo "      sync.sh"
   echo "      sync.sh -u"
}

# Set variable defaults
ALSO_COMPOSER_UPDATE=""

# Get the options
while getopts ":uh" option; do
   case $option in
      u)
         ALSO_COMPOSER_UPDATE="1";;
      h) # display Help
         Help
         exit;;
   esac
done

# Export vars for other scripts
export ALSO_COMPOSER_UPDATE=${ALSO_COMPOSER_UPDATE}

# Clears everything in the repo
echo "Delete the contents of the dist folder"
rm -r ./dist/*

# Fetches things from the web
$BASEDIR/sync/pacman

echo "Copy required files into the 'dist' dir"
cp -v -r ./dist-persist/* ./dist/

# Does a composer install
$BASEDIR/sync/04-docker-composer.sh

# Adds shim to .php entrypoints
$BASEDIR/sync/05-docker-entrypoint-overrides.sh
