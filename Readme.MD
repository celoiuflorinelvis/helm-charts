
```
cp -r .gitignore $(ls -1A | grep -v .git) ../cpapp
```

### Creates docker secret
```
kubectl create secret docker-registry container-registry \
        "--docker-server=..." \
        "--docker-username=..." \
        "--docker-email=..." \
        "--docker-password=..."
```

### Add XSUAA support 
```
cds add xsuaa --for production
```

### Add HANA DB support
```
cds build --production --for hana
cds deploy --to hana:cpapp-db
```

### Add Helm charts
```
helm repo add bitnami https://charts.bitnami.com/bitnami
--- search on all local repo
helm search repo
helm search repo bitnami
--- search online hub
helm search hub wordpress
helm repo update
--- login kubectl
helm install bitnami/mongodb --generate-name
helm install mongodb-1661203861 bitnami/mongodb
helm show all bitnami/mysql
helm list
helm status mongodb-1661203861
helm uninstall mongodb-1661203861
helm uninstall mongodb-1661203861 --keep-history
helm rollback mongodb-1661203861
helm rollback mongodb-1661203861 1
helm history mongodb-1661203861
helm get values mongodb-1661203861
helm upgrade --values ../values-mongodb.yaml mongodb-1661203861 bitnami/mongodb

helm show values bitnami/wordpress

helm show values bitnami/mongodb
echo '{mariadb.auth.database: user0db, mariadb.auth.username: user0}' > values.yaml
helm install -f values.yaml bitnami/wordpress --generate-name

helm install foo foo-0.1.1.tgz
helm install foo path/to/foo
helm install foo https://example.com/charts/foo-1.2.3.tgz

helm repo remove

```

#### Mongodb installation logs
```
NAME: mongodb-1661203861
LAST DEPLOYED: Tue Aug 23 00:31:31 2022
NAMESPACE: dev-cf
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: mongodb
CHART VERSION: 13.1.0
APP VERSION: 6.0.1

** Please be patient while the chart is being deployed **

MongoDB&reg; can be accessed on the following DNS name(s) and ports from within your cluster:

    mongodb-1661203861.dev-cf.svc.cluster.local

To get the root password run:

    export MONGODB_ROOT_PASSWORD=$(kubectl get secret --namespace dev-cf mongodb-1661203861 -o jsonpath="{.data.mongodb-root-password}" | base64 -d)

To connect to your database, create a MongoDB&reg; client container:

    kubectl run --namespace dev-cf mongodb-1661203861-client --rm --tty -i --restart='Never' --env="MONGODB_ROOT_PASSWORD=$MONGODB_ROOT_PASSWORD" --image docker.io/bitnami/mongodb:6.0.1-debian-11-r1 --command -- bash

Then, run the following command:
    mongosh admin --host "mongodb-1661203861" --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace dev-cf svc/mongodb-1661203861 27017:27017 &
    mongosh --host 127.0.0.1 --authenticationDatabase admin -p $MONGODB_ROOT_PASSWORD
```

### Create Charts
```
helm create mycharts
helm install mycharts-v1 ./mycharts
helm get manifest mycharts-v1
helm install --debug --dry-run mycharts-v1x ./mycharts
helm upgrade --values ./mycharts/values-ro.yaml  mycharts-v1 ./mycharts
helm upgrade --values ./mycharts/values-ro.yaml  mycharts-v1 ./mycharts --set favorite.drink=palinca
helm lint ./mycharts 
helm install --dry-run --debug ./mycharts  --generate-name
helm template --debug ./mycharts
helm get manifest mycharts-v1 

```
