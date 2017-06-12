docker save -o eap64-euckr-ajp.tar jboss-eap-6/eap64-openshift-euckr-ajp:latest

scp eap64-euckr-ajp.tar root@orarepo.ora01000.com:/root
ssh root@orarepo.ora01000.com "docker load -i /root/eap64-euckr-ajp.tar"
ssh root@orarepo.ora01000.com "docker tag jboss-eap-6/eap64-openshift-euckr-ajp:latest 10.0.1.125:5000/jboss-eap-6/eap64-openshift-euckr-ajp:latest && docker rmi jboss-eap-6/eap64-openshift-euckr-ajp:latest"
ssh root@orarepo.ora01000.com "docker push 10.0.1.125:5000/jboss-eap-6/eap64-openshift-euckr-ajp:latest"
ssh root@oramaster.ora01000.com "oc login -u reguser -p reguser"
ssh root@oramaster.ora01000.com "oc import-image jboss-eap64-openshift-euckr-ajp -n openshift --insecure=true"

