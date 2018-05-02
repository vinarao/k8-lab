#/bin/bash
echo  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo Launch 3 Pods 
echo a.web 
echo b.app 
echo c.db 
echo Attaches Contrail FW Policies
echo  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

read -p "Press enter to continue" pause

echo Create pods

kubectl create -f db-dev.yml
#sleep 2
kubectl create -f app-dev.yml
#sleep 2
kubectl create -f web-dev.yml 
#sleep 2

echo  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo  ----------------------Create and Apply Policies-------------
echo  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
read -p "Press enter to continue" pause

echo web to app
kubectl create -f policy-web-to-app.yml
#sleep 2

echo web to LDAP service running on BMS
kubectl create -f policy-web-to-admin.yml
#sleep 2

echo app to db
kubectl create -f policy-app-to-db.yml
sleep 3

echo Egress policy for web

kubectl create -f policy-web-egress.yml
sleep 3

echo  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo  ----------------------Check Pods Status----------------
echo  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

kubectl get pods --show-labels -o wide








