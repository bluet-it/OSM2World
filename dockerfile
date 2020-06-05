FROM openjdk:buster
RUN apt update
RUN apt install curl unzip
RUN curl http://osm2world.org/download/files/latest/OSM2World-latest-bin.zip -o osm2world.zip
RUN unzip osm2world.zip -d osm2world
RUN rm osm2world.zip
RUN echo "#! /bin/bash\n./osm2world/osm2world.sh -i ../input/*.osm -o ../output/map.obj --config ../input/*.properties" > run.sh
RUN chmod +x run.sh
VOLUME /data/input /data/output
CMD ./run.sh
