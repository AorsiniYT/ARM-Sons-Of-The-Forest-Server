export PATH=/usr/local/bin:$PATH
wine wineboot && wine64 wineboot
xvfb-run sh -c "winetricks -q vcrun2019"
wine64 /steamcmd/steamcmd.exe +force_install_dir Z:/theforest +login anonymous +app_update 242760 validate +quit
exit 0
