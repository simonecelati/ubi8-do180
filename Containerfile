FROM registry.access.redhat.com/ubi8
MAINTAINER "Simone Celati"
RUN yum install -y unzip && yum clean all
RUN useradd -r alfio -m -d /home/alfio
WORKDIR /home/alfio/
ADD ./zipfiles.zip .
RUN mkdir decompression-chamber && chmod -R 777 zipfiles.zip decompression-chamber/ && chown -R alfio:alfio zipfiles.zip decompression-chamber/ 
USER alfio
ENTRYPOINT ["/bin/bash", "-c", "--"] 
CMD ["while true; do sleep 30; done;"] 
#RUN mv zipfiles.zip decompression-chamber/ && unzip decompression-chamber/zipfiles.zip
