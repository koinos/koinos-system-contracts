#!/bin/bash
set -e
set -x

if ! [[ -z $BUILD_DOCKER ]]; then
   TAG="$TRAVIS_BRANCH"
   if [ "$TAG" = "master" ]; then
      TAG="latest"
   fi

   export BLOCK_PRODUCER_TAG=$TAG

   git clone https://github.com/koinos/koinos-integration-tests.git

   cd koinos-integration-tests
   go get ./...
   cd tests
   ./run.sh
fi
