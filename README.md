# Добавление репозитория.
helm repo add nikolaybezdenezhnykh-repo https://nikolaybezdenezhnykh.github.io/helm-charts/ 

# Установка приложений.

## auth-service
helm install auth-service nikolaybezdenezhnykh-repo/auth-service

## user-service
helm install user-service nikolaybezdenezhnykh-repo/user-service

# Удаление приложений.

## auth-service
helm delete auth-service

## user-service
helm delete user-service

# Удаление репозитория.
helm repo remove nikolaybezdenezhnykh-repo

