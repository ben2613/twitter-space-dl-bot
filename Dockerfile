FROM jrottenberg/ffmpeg:4.1-alpine
# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install twspace-dl
#assume x64 i guess
RUN wget -O - https://github.com/prasmussen/gdrive/releases/download/2.1.1/gdrive_2.1.1_linux_amd64.tar.gz \
  | tar -zx -C /usr/local/bin -f -
RUN apk add inotify-tools
ENV GDRIVE_CONFIG_DIR=/gdrive
COPY download.sh monitor_file.sh run.sh /gdrive/

WORKDIR /gdrive
RUN chmod +x download.sh monitor_file.sh run.sh
# remove entrypoint from ffmpeg
ENTRYPOINT []
