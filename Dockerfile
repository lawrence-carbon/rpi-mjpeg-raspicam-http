FROM resin/rpi-raspbian:jessie

RUN apt-get update
RUN apt-get install -y libjpeg8-dev make gcc
RUN apt-get install -y cmake
RUN apt-get install -y git

RUN cd && git clone https://github.com/jacksonliam/mjpg-streamer.git

RUN cd ~/mjpg-streamer/mjpg-streamer-experimental/plugins/
RUN rm -rf input_control input_file input_http input_opencv input_ptp2 input_testpicture output_autofocus output_file output_rtsp output_udp output_viewer

RUN apt-get install -y build-essential

RUN cd ~/mjpg-streamer/mjpg-streamer-experimental && make && sudo make install

RUN apt-get remove -y libjpeg8-dev
RUN apt-get remove -y cmake
RUN apt-get remove -y git
