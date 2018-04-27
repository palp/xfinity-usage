FROM selenium/standalone-firefox
USER root
RUN apt-get update
RUN apt-get install -y python3-pip
RUN rm -rf /var/lib/apt/lists/

COPY . /usr/src/app
WORKDIR /usr/src/app
RUN pip3 install .
WORKDIR /root
RUN rm -rf /usr/src/app
COPY docker-run.sh /root/run.sh
ENV INTERVAL=300
CMD /root/run.sh
