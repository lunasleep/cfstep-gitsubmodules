#!/bin/sh

if [ -z "$GITHUB_TOKEN" ]; then
    echo "ERROR: \$GITHUB_TOKEN var is not set or empty"
    exit
fi

echo "Updating git submodules"

mkdir ~/.ssh
ssh-keyscan github.com > ~/.ssh/known_hosts
sed -i 's/git@/https:\/\//' .gitmodules
sed -i 's/ssh:\/\///' .gitmodules
sed -i 's/github.com:/github.com\//' .gitmodules
sed -i "s/https:\/\/github.com/https:\/\/$GITHUB_TOKEN@github.com/" .gitmodules

if [ "$CF_SUBMODULE_SYNC" = "true" ]; then
  echo "\$CF_SUBMODULE_SYNC var is set to 'true'. Syncing submodules"
  git submodule sync
fi

git submodule update --init
echo "Git submodules were updated"