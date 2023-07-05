# Инструкция по установке.

1. Установка Postgresql

helm install postgresql oci://registry-1.docker.io/bitnamicharts/postgresql --set primary.initdb.scripts."init\\.sql"="CREATE USER authservice WITH LOGIN CREATEDB PASSWORD 'password';CREATE USER userservice WITH LOGIN CREATEDB PASSWORD 'password';CREATE USER orderservice WITH LOGIN CREATEDB PASSWORD 'password';"

2. Установка nginx-ingress

helm install nginx-ingress oci://ghcr.io/nginxinc/charts/nginx-ingress --set controller.service.httpPort.port=80 --set controller.enableSnippets=True

3. Установка приложений

helm repo add nikolaybezdenezhnykh-repo https://nikolaybezdenezhnykh.github.io/helm-charts/ && helm install auth-service nikolaybezdenezhnykh-repo/auth-service && helm install user-service nikolaybezdenezhnykh-repo/user-service && helm install order-service nikolaybezdenezhnykh-repo/order-service

4. Установка ingress-route

kubectl apply -f ./charts/ingress.yaml

## Схема взаимодействия сервисов

Представлена на картинке ./charts/Apigateway.png

# Инструкция по удалению.

1. Удаление ingress-route

kubectl delete ingress/ingress-route

2. Удаление приложений (вместе с репозиторием)

helm delete auth-service && helm delete user-service && helm delete order-service && helm repo remove nikolaybezdenezhnykh-repo

3. Удаление Postgresql

helm delete postgresql && kubectl delete pvc -l app.kubernetes.io/name=postgresql

4. Удаление nginx-ingress

helm delete nginx-ingress

