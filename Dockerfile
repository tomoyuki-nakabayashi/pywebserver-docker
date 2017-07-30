FROM registry.ng.bluemix.net/ibmnode

# replace python version to have 3.4.4 as default
RUN rm -f /usr/bin/python
RUN rm -f /usr/bin/python3
RUN ln -s /usr/bin/python3.4 /usr/bin/python
RUN ln -s /usr/bin/python3.4 /usr/bin/python3
# Pip
RUN apt-get install -y python3-pip
RUN pip3 uninstall pep8 ; pip3 install pep8 ; pip3 install --upgrade pep8
RUN pip3 install bottle

ADD ./app /node-hello

ENV NODE_ENV production

EXPOSE 3000
	
CMD ["node", "/node-hello/app.js"]
