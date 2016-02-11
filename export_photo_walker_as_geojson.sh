#!/bin/bash
sqlite3 PhotoWalker.sqlite <<!
.headers off
.output ambient.json
select '{"type":"Feature","geometry":{"type":"Point","coordinates":[' || zlongitude || ',' || zlatitude ||']}, "properties":{"brightness":'|| zbrightness || ', "timestamp":"' || strftime('%Y-%m-%d %H:%M:%S', datetime(ZTIMESTAMP+978307200, 'unixepoch', 'localtime')) || '"}},' from ZAMBIENT where datetime(ZTIMESTAMP+978307200, 'unixepoch', 'localtime') > '2016-02-11 18:00:00';
!
sed -i '' '$ s/.$//' ambient.json
echo '{ "type": "FeatureCollection", "features": [' > ambient.geojson
cat ambient.json >> ambient.geojson
echo "]}" >> ambient.geojson
rm ambient.json