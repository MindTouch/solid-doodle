#!/bin/bash

cd /mindtouch/solid-doodle/TestLogParser/
/usr/bin/dotnet restore
/usr/bin/dotnet test

sleep 20 

exit 1
