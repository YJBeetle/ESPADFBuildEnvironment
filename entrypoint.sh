#!/usr/bin/env bash
set -e

export ADF_PATH=/opt/esp/adf
. $IDF_PATH/export.sh

exec "$@"
