#!/bin/bash

set -x
pwd
cd "src"

# pwd
# ls -al

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
set -x    
find . -name "version.go" | while read versionfile; do

    echo "Replacing tags in ${versionfile}"

    sed -i "s#<BUILD_ID>#${BUILD_ID}#g"     ${versionfile}
    sed -i "s#<TIMESTAMP>#${TIMESTAMP}#g"   ${versionfile}
    sed -i "s#<GIT_COMMIT>#${GIT_COMMIT}#g" ${versionfile}
    sed -i "s#<GIT_BRANCH>#${GIT_BRANCH}#g" ${versionfile}
    sed -i "s#<GIT_URL>#${GIT_URL}#g"       ${versionfile}
done

# mvn versions:set -DnewVersion=${BUILD_ID}
