#!/bin/bash
sqlite3 PhotoWalker.sqlite <<!
.headers off
.mode column
.output ambient.json

select '{"type":"Feature","geometry":{"type":"Point","coordinates":[' || zlatitude || ',' || zlongitude ||']}, "properties":{"brightness":'|| zbrightness || ', "timestamp":"' || strftime('%Y-%m-%d %H:%M:%S', datetime(ZTIMESTAMP+978307200, 'unixepoch', 'localtime')) || '"}},' from ZAMBIENT where datetime(ZTIMESTAMP+978307200, 'unixepoch', 'localtime') > '2016-02-11 18:00:00' LIMIT 1000;
!
echo '{ "type": "FeatureCollection", "features": [' > ambient.geojson
cat ambient.json >> ambient.geojson
echo "]}" >> ambient.geojson
rm ambient.json