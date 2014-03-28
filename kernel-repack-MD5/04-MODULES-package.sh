#!/bin/bash

rm k-ok r-ok

cd modules && zip -r ../modules.zip . ;
cd ..
mv modules.zip ../$(cat ../common/.version)-modules.zip && echo "$(cat ../common/.version)-modules.zip <-> READY"

echo "MODULES DONE";

sleep 5
