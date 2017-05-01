#!/bin/bash

if [ ! -f $SAVEFILE ]; then
  /opt/factorio/bin/x64/factorio --create $SAVEFILE --server-settings $SETTING
fi
/opt/factorio/bin/x64/factorio --start-server $SAVEFILE --server-settings $SETTING
