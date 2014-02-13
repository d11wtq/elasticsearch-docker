FROM       ubuntu
MAINTAINER Chris Corbyn

RUN apt-get install -qq -y curl openjdk-6-jdk

ENV PKG_VER  1.0.0
ENV PKG_NAME elasticsearch
ENV PKG_HOST https://download.elasticsearch.org

RUN useradd -m -s /bin/bash $PKG_NAME

ADD $PKG_HOST/$PKG_NAME/$PKG_NAME/$PKG_NAME-$PKG_VER.tar.gz /home/elasticsearch
RUN ln -s ~elasticsearch/$PKG_NAME-$PKG_VER ~elasticsearch/$PKG_NAME
RUN chown -R elasticsearch: ~elasticsearch

ENV     HOME /home/elasticsearch
WORKDIR /home/elasticsearch
USER    elasticsearch

EXPOSE 9200 9300

CMD ["elasticsearch/bin/elasticsearch"]
