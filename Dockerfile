FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y python3-pip python3-dev fabric \
      libpq-dev libjpeg-dev libxml2-dev libxslt-dev libfreetype6-dev \
      postgresql-client git curl wget

# replace python version to have 3.4.4 as default
RUN rm -f /usr/bin/python
RUN ln -s /usr/bin/python3 /usr/bin/python
# Pip
RUN pip3 install bottle

ADD ./app /py-webserver

EXPOSE 9999
	
CMD ["python", "/py-webserver/app.py"]
