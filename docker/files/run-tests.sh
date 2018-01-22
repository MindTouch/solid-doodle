#!/bin/bash

cd /mindtouch/solid-doodle/TestLogParser/
/usr/bin/dotnet restore
/usr/bin/dotnet test
sleep 10
exit 1
