#!/bin/bash

set -x
pwd
cd "src"
pwd
ls -al

REPOSITORY=releases
REPOSITORYID=releases

GROUPID=com.rsmaxwell.players
ARTIFACTID=players-tt
VERSION=${BUILD_ID}
PACKAGING=zip

URL=https://server.rsmaxwell.co.uk/archiva/repository/${REPOSITORY}

FILENAME=${ARTIFACTID}_${VERSION}.${PACKAGING}

rm -rf deploy
mkdir -p deploy

cd dist/players-tt
zip ../deploy/${FILENAME} *

cd ../deploy
mvn --batch-mode deploy:deploy-file -DgroupId=${GROUPID} -DartifactId=${ARTIFACTID} -Dversion=${VERSION} -Dpackaging=${PACKAGING} -Dfile=${FILENAME} -DrepositoryId=${REPOSITORYID} -Durl=${URL} -DrepositoryId=${REPOSITORYID}

