# Инструкция по установке.

1. Установка Postgresql

helm install postgresql oci://registry-1.docker.io/bitnamicharts/postgresql --set primary.initdb.scripts."init\.sql"="CREATE USER authservice WITH LOGIN CREATEDB PASSWORD 'password';CREATE USER userservice WITH LOGIN CREATEDB PASSWORD 'password';"

2. Установка nginx-ingress

helm install nginx-ingress oci://ghcr.io/nginxinc/charts/nginx-ingress --set controller.service.httpPort.port=80 --set controller.enableSnippets=True

3. Установка приложений

helm repo add nikolaybezdenezhnykh-repo https://nikolaybezdenezhnykh.github.io/helm-charts/ && helm install auth-service nikolaybezdenezhnykh-repo/auth-service && helm install user-service nikolaybezdenezhnykh-repo/user-service

4. Установка ingress-route

kubectl apply -f ingress.yaml

# Инструкция по удалению.

1. Удаление ingress-route

kubectl delete ingress/ingress-route

2. Удаление приложений (вместе с репозиторием)

helm delete auth-service && helm delete user-service && helm repo remove nikolaybezdenezhnykh-repo

3. Удаление Postgresql (вместе с репозиторием)

helm delete postgresql && helm repo remove runix

4. Удаление nginx-ingress (вместе с репозиторием)

helm delete nginx-ingress && helm repo remove ingress-nginx

