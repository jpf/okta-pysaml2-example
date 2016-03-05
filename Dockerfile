FROM python:2.7

# Install xmlsec1
RUN echo 'deb http://mirror.isoc.org.il/pub/ubuntu/ trusty main universe' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y --no-install-recommends install xmlsec1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
CMD python app.py
