set -e

echo "Running install_meteor.sh"

curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh

echo "Meteor installed"