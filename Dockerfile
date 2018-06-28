
#IMAGE: Get the base image for Liberty
FROM websphere-liberty:webProfile7

#BINARIES: Add in all necessary application binaries
COPY ./server.xml /config
COPY .//daytrader3-ee6/target/daytrader3-ee6-1.0-SNAPSHOT.ear /config/dropins
RUN mkdir /config/lib
RUN mkdir /config/lib/global
COPY ./binary/lib/* /config/lib/
COPY ./commons-logging-1.1.3.jar /config/lib/global

#FEATURES: Install any features that are required
RUN /opt/ibm/wlp/bin/installUtility install  --acceptLicense \
	jsp-2.3 \
	ejbLite-3.2 \
	jaxb-2.2 \
	servlet-3.1 \
	jsf-2.2 \
	mdb-3.2 \
	jndi-1.0 \
	jdbc-4.2 \
	jms-2.0 \
	jpa-2.1 \
	wasJmsServer-1.0 \
	wasJmsClient-2.0 
