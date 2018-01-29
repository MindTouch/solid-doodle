#!/bin/bash

cd /mindtouch/solid-doodle/TestLogParser/
/usr/bin/dotnet restore
/usr/bin/dotnet test

sleep 5
exit 1
