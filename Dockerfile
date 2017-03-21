FROM gliderlabs/alpine
MAINTAINER FoxChan
COPY requirements.txt /requirements.txt
RUN apk-install python py-pip \
    && pip install -r /requirements.txt \
    && apk del py-pip
COPY kube2consul.py /kube2pyconsul.py
WORKDIR /
ENTRYPOINT ["python", "/kube2pyconsul.py"]
