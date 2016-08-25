set -e

echo "Running build_app.sh"

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# sometimes, directly copied folder cause some wierd issues
# this fixes that
echo "Copying app to temporary directory for building"
cp -R /app $COPIED_APP_PATH
cd $COPIED_APP_PATH

echo "Running 'meteor npm install'"
meteor npm install

echo "Running 'meteor build'"
meteor build --directory $BUNDLE_DIR --server=http://localhost:3000

echo "Copying built app to bundle"
cd $BUNDLE_DIR/bundle/programs/server/
#npm i

mv $BUNDLE_DIR/bundle /built_app

echo "Removing original source code and intermediate build artifacts"
# cleanup
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR

echo "Removing Meteor installation"
rm -rf ~/.meteor
rm /usr/local/bin/meteor