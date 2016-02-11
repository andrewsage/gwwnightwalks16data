#!/bin/bash
sqlite3 PhotoWalker.sqlite <<!
.headers on
.mode csv
.output ambient.csv
select zbrightness as brightness, zlatitude as latitude, zlongitude as longitude,strftime('%Y-%m-%d %H:%M:%S', datetime(ZTIMESTAMP+978307200, 'unixepoch', 'localtime')) as timestamp from ZAMBIENT where datetime(ZTIMESTAMP+978307200, 'unixepoch', 'localtime') > '2016-02-11 18:00:00' LIMIT 1000;
!
