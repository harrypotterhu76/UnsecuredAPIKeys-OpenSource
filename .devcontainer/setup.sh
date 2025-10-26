#!/bin/bash

echo "Setting up UnsecuredAPIKeys development environment..."

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL..."
until pg_isready -h localhost -p 5432 -U postgres; do
  sleep 2
done

# Copy example configuration files if they don't exist
if [ ! -f "UnsecuredAPIKeys.WebAPI/appsettings.json" ]; then
  cp UnsecuredAPIKeys.WebAPI/appsettings.example.json UnsecuredAPIKeys.WebAPI/appsettings.json
  echo "Created WebAPI appsettings.json"
fi

if [ ! -f "UnsecuredAPIKeys.UI/.env.development" ]; then
  cp UnsecuredAPIKeys.UI/.env.example UnsecuredAPIKeys.UI/.env.development
  echo "Created UI .env.development"
fi

if [ ! -f "UnsecuredAPIKeys.Bots.Verifier/appsettings.json" ]; then
  cp UnsecuredAPIKeys.Bots.Verifier/appsettings.example.json UnsecuredAPIKeys.Bots.Verifier/appsettings.json
  echo "Created Verifier appsettings.json"
fi

# Run database migrations
echo "Running database migrations..."
cd UnsecuredAPIKeys.WebAPI
dotnet ef database update --project ../UnsecuredAPIKeys.Data --startup-project . --connection "Host=localhost;Database=UnsecuredAPIKeys;Username=postgres;Password=devpassword;Port=5432"
cd ..

# Install UI dependencies
echo "Installing UI dependencies..."
cd UnsecuredAPIKeys.UI
npm install
cd ..

echo "Setup complete! You can now start the services."
