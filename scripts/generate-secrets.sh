name_space=$1
user_name=$2
name_of_secret=$3

openssl rand -base64 32 > /tmp/secret

kubectl create secret generic $name_of_secret \
    -n $name_space \
    --from-literal username=$user_name \
    --from-file password=/tmp/secret