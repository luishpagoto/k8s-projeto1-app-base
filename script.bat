echo "Criando as imagens..."
docker build -t luishp/projeto-backend:1.0 backend/.
docker build -t luishp/projeto-database:1.0 database/.

echo "subindo as imagens no docker hub..."

docker push luishp/projeto-backend:1.0
docker push luishp/projeto-database:1.0

echo "servicos de loadbalancer...."


kubectl apply -f ./services.yml

echo "criando deployments..."

kubectl apply -f ./deployment.yml
