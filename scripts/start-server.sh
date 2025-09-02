#!/bin/bash

echo "Starting The Forest Dedicated Server..."
xvfb-run -a wine64 TheForestDedicatedServer.exe -serverdatafolder 'Z:/server-data'
