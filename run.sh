#!/bin/bash

rm -rfv dist &&
rm -rfv src/message-api &&
java -jar util/openapi-generator-cli.jar validate -i src/message-api.json &&
java -jar util/openapi-generator-cli.jar generate -i src/message-api.json -g typescript-angular -o src/message-api &&
npm install &&
ng build &&
npm cache clean --force &&
npm pack --pack-destination dist &&
npm install --no-save --no-fund ./dist/message-api-0.0.1.tgz &&
echo "OK" ||
echo "ER" ;

#eof