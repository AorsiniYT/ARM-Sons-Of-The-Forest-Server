export PATH=/usr/local/bin:$PATH
/steamcmd/steamcmd.sh +force_install_dir /theforest +login anonymous +app_update 556450 +quit
echo "Waiting for download to complete..."TH=/usr/local/bin:$PATH
echo '#!/bin/bash
box64 wine64 "$@"' > /usr/local/bin/wine-wrapper
chmod +x /usr/local/bin/wine-wrapper
export WINE=/usr/local/bin/wine-wrapper
xvfb-run sh -c "winetricks -q vcrun2019"
echo "Starting SteamCMD installation..."
wine64 /steamcmd/steamcmd.exe +force_install_dir Z:/theforest +login anonymous +app_update 556450 +quit
echo "Waiting for download to complete..."
attempts=0
max_attempts=100  # ~50 minutes with 30s sleep
while [ ! -f "/theforest/steamapps/common/The Forest Dedicated Server/TheForestDedicatedServer.exe" ]; do
  if [ $attempts -ge $max_attempts ]; then
    echo "Download timeout after $((attempts * 30 / 60)) minutes. Check connection or try again."
    exit 1
  fi
  size=$(du -sh /theforest/steamapps/downloading/556450/ 2>/dev/null | awk '{print $1}' || echo "Calculating...")
  echo "Downloading... Current size: $size (attempt $((attempts + 1))/$max_attempts)"
  sleep 30
  attempts=$((attempts + 1))
done
echo "Download complete."
echo "SteamCMD finished. Checking installation..."
ls -la /theforest
echo "Checking steamapps..."
ls -la /theforest/steamapps 2>/dev/null || echo "steamapps not found"
exit 0
