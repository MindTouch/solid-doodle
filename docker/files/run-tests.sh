#!/bin/bash

cd /mindtouch/solid-doodle/TestLogParser/
/usr/bin/dotnet restore
/usr/bin/dotnet test

sleep 60
exit 1
