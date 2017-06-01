#!/bin/bash
#nohup rails s -d > /dev/null 2>&1 &
nohup rails s  -e production -d > /dev/null 2>&1 &
