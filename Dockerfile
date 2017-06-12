FROM jboss-eap-6/eap64-openshift

## Add AJP connector

MAINTAINER Yun In Su <ora01000@time-gate.com>

USER root

## Korean Language Pack enable

RUN localedef -f UTF-8 -i ko_KR ko_KR.UTF-8 && localedef -f EUC-KR -i ko_KR ko_KR.euckr

USER jboss

COPY ./configuration/standalone-openshift.xml /opt/eap/standalone/configuration

EXPOSE 8009

USER root

RUN chown jboss:jboss /opt/eap/standalone/configuration/standalone-openshift.xml

# Switch to the user 185 for OpenShift usage
USER 185

# Start the main process
CMD ["/opt/eap/bin/openshift-launch.sh"]
