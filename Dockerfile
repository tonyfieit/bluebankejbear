
#IMAGE: Get the base image for Liberty
FROM websphere-liberty:webProfile7

#BINARIES: Add in all necessary application binaries
COPY ./server.xml /config
COPY ./binary/application/* /config/apps/
#RUN mkdir /config/lib
#COPY ./binary/lib/* /config/lib/

ADD  ./binary/resource.zip /config/
RUN cd /config \
  && unzip /config/resource.zip \
  && rm /config/resource.zip

#FEATURES: Install any features that are required
RUN /opt/ibm/wlp/bin/installUtility install  --acceptLicense \
	jsp-2.3 \
	ejbLite-3.2 \
	ejbRemote-3.2 \
	servlet-3.1 \
	jdbc-4.2 \
	jpa-2.0; exit 0

