#!/bin/bash

rm -rfv package-lock.json node_modules .angular dist src/message-api &&
java -jar util/openapi-generator-cli.jar validate -i src/message-api.json &&
java -jar util/openapi-generator-cli.jar generate -i src/message-api.json -g typescript-angular -o src/message-api &&
npm install &&
npm run-script build &&
npm pack ./dist/message-api --pack-destination dist &&
#---
# to publish to network repo:
# npm publish ./dist/message-api --access public &&
#---
echo "OK" ||
echo "ER" ;

#eof