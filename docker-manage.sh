#!/bin/zsh
set -eu

echo "Building App Container"
docker build -t travelsaveapi .

echo "Creating network bridge (or using existing one)"
docker network create travelsavenetwork 2>/dev/null || true

echo "Removing old PostgreSQL container if it exists"
docker rm -f TravelSaveDb 2>/dev/null || true

echo "Running POSTGRESQL"
docker run -d \
  --name TravelSaveDb \
  --network travelsavenetwork \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=1234 \
  -e POSTGRES_DB=TravelSaveDb \
  -v pgdata:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgres:15

echo "Waiting for Database to be ready..."
sleep 5

echo "Removing old API container if it exists"
docker rm -f TravelSaveApi 2>/dev/null || true

echo "Running TravelSave API"
docker run -d \
  --name TravelSaveApi \
  --network travelsavenetwork \
  -p 5000:8080 \
  -e ASPNETCORE_ENVIRONMENT=Development \
  -e "ConnectionStrings__DefaultConnection=Host=TravelSaveDb;Port=5432;Database=TravelSaveDb;Username=postgres;Password=1234" \
  travelsaveapi


echo "✅ Both containers are running."
echo "Access the API at: http://localhost:5000"
echo "Swagger UI: http://localhost:5000/swagger"