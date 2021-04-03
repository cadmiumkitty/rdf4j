FROM tomcat:8.5-jdk8-openjdk-buster

ENV vb_version=9.0.0
ENV st_version=9.0
ENV rdf4j_version=3.6.2

ENV CATALINA_OPTS="-Dorg.eclipse.rdf4j.appdata.basedir=/var/rdf4j"

RUN curl -L https://bitbucket.org/art-uniroma2/vocbench3/downloads/vocbench3-${vb_version}-full.zip --output /tmp/vocbench3-${vb_version}-full.zip
RUN curl -L "https://www.eclipse.org/downloads/download.php?file=/rdf4j/eclipse-rdf4j-${rdf4j_version}-sdk.zip&r=1" --output /tmp/eclipse-rdf4j-${rdf4j_version}-sdk.zip

RUN set -eux ; \
    unzip -q /tmp/eclipse-rdf4j-${rdf4j_version}-sdk.zip -d /tmp/ ; \
	mkdir /usr/local/tomcat/webapps/rdf4j-server ; \
	mkdir /usr/local/tomcat/webapps/rdf4j-workbench ; \
	unzip /tmp/eclipse-rdf4j-${rdf4j_version}/war/rdf4j-server.war -d /usr/local/tomcat/webapps/rdf4j-server ; \
	unzip /tmp/eclipse-rdf4j-${rdf4j_version}/war/rdf4j-workbench.war -d /usr/local/tomcat/webapps/rdf4j-workbench ; \
	rm -Rf /tmp/eclipse-rdf4j-${rdf4j_version} ; \
	rm /tmp/eclipse-rdf4j-${rdf4j_version}-sdk.zip ; \
	unzip -q /tmp/vocbench3-${vb_version}-full.zip -d /tmp/ ; \
	cp /tmp/semanticturkey-${st_version}/system/it/uniroma2/art/semanticturkey/st-trivial-inference-sail/${st_version}/st-trivial-inference-sail-${st_version}.jar /usr/local/tomcat/webapps/rdf4j-server/WEB-INF/lib ; \
	cp /tmp/semanticturkey-${st_version}/system/it/uniroma2/art/semanticturkey/st-changetracking-sail/${st_version}/st-changetracking-sail-${st_version}.jar /usr/local/tomcat/webapps/rdf4j-server/WEB-INF/lib ; \
	rm -Rf /tmp/vocbench3-${vb_version} ; \
	rm /tmp/vocbench3-${vb_version}-full.zip ;\
	mkdir /var/rdf4j

WORKDIR /usr/local/tomcat/

EXPOSE 8080