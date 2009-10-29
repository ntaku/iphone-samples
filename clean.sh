#!/bin/bash
find ./ -name build -exec rm -rf {} \;
find ./ -name '*.mode1v3' -exec rm -rf {} \;
find ./ -name '*.pbxuser' -exec rm -rf {} \;
