#/bin/bash
kubectl delete -f db-dev.yml
sleep 2
kubectl delete -f app-dev.yml
sleep 2
kubectl delete -f web-dev.yml 
sleep 2
kubectl delete -f policy-web-to-app.yml
#sleep 2
kubectl delete -f policy-web-to-admin.yml
kubectl delete -f policy-app-to-db.yml
kubectl delete -f policy-web-egress.yml
kubectl get pods --show-labels -o wide








