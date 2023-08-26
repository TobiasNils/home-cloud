$(openssl rand -base64 32) > admin.txt

kubectl create secret generic gitea-admin-secret \
    -n home \
    --from-literal username=git \
    --from-file password=./admin.txt