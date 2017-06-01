#!/bin/bash
#nohup rails s -d > /dev/null 2>&1 &
nohup rails s -p 3001  -e production -d > /dev/null 2>&1 &
