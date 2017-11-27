FROM resin/rpi-raspbian:stretch
LABEL maintainer="o00ogrfxo00o@gmail.com"

RUN apt-get update && apt-get install -y \
    mencoder \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

VOLUME [/indir]
VOLUME [/outdir]

ENV OUTFILE=out.mp4
ENV BITRATE=7000
ENV FPS=25
ENV TYPE=jpg
ENV SCALE=1280:720

RUN echo "Europe/Vienna" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

WORKDIR /indir

CMD mencoder mf://*.$TYPE -mf fps=$FPS:type=$TYPE -ovc lavc \ -lavcopts vcodec=mpeg4:mbd=2:trell:v bitrate=$BITRATE -vf scale=$SCALE -oac copy -o /outdir/$OUTFILE
