FROM resin/rpi-raspbian:wheezy
LABEL maintainer="o00ogrfxo00o@gmail.com"

RUN apt-get update && apt-get install -y \
    libav-tools \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

VOLUME [/indir]
VOLUME [/outdir]

ENV OUTFILE=out.mp4
ENV FPS=24
ENV SCALE=1280:720

CMD cd /indir && \
    avconv -y -r $FPS -i '%04d.jpg' -r $FPS -vcodec libx264 -g 12 -vf scale=$SCALE /outdir/$OUTFILE
