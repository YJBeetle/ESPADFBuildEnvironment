FROM espressif/idf:release-v5.3

ENV ADF_PATH /opt/esp/adf
ENV ESP_ADF_VERSION e218638621d421eacb78b79179bde6c1710393b4

RUN apt-get update && apt-get install -y --no-install-recommends \
        git &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -f /usr/lib/python*/EXTERNALLY-MANAGED

RUN mkdir -p $ADF_PATH && cd $ADF_PATH &&\
    git init &&\
    git remote add origin https://github.com/espressif/esp-adf.git &&\
    git fetch --depth 1 origin $ESP_ADF_VERSION &&\
    git checkout FETCH_HEAD &&\
    git submodule update --init --recursive --depth 1 &&\
    ./install.sh

COPY entrypoint.sh /opt/esp/entrypoint.sh
RUN /opt/esp/entrypoint.sh
ENTRYPOINT ["/opt/esp/entrypoint.sh"]
