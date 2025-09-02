export PATH=/usr/local/bin:$PATH
wine wineboot && wine64 wineboot
xvfb-run sh -c "winetricks -q vcrun2019"
echo "Starting SteamCMD installation..."
wine64 /steamcmd/steamcmd.exe +force_install_dir Z:/theforest +login anonymous +app_update 556450 validate +quit
echo "SteamCMD finished. Checking installation..."
ls -la /theforest
echo "Checking steamapps..."
ls -la /theforest/steamapps 2>/dev/null || echo "steamapps not found"
exit 0
