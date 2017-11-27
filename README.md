# rpi-timelapse

Mit diesem Container können alle Einzelbilder eines Verzeichnisses in ein Video umgewandelt werden.

**Achtung**: Das Umwandeln kann eine sehr lange Zeit in Anspruch nehmen!

Folgende Optionen können angegeben werden:

|Option|Vorgabe|
|---|---|
|OUTFILE|out.mp4|
|FPS|25|
|SCALE|1280:720|

*Beispiel*:

    docker run -d --name timelapse -v /path/to/images:/indir -v /path/to/output/dir:/outdir -e OUTFILE=myvideo.mp4 -e SCALE="800:600" o00ogrfxo00o/rpi-timelapse
    
