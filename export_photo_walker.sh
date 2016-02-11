#!/bin/bash
sqlite3 PhotoWalker.sqlite <<!
.headers on
.mode csv
.output ambient.csv
select zbrightness, zlatitude as latitude, zlongitude as longitude,strftime('%Y-%m-%d %H:%M:%S', datetime(ZTIMESTAMP+978307200, 'unixepoch', 'localtime')) as timestamp from ZAMBIENT;
!
