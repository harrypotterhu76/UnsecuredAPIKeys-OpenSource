# Start with Microsoft's official .NET 8 devcontainer as base
FROM mcr.microsoft.com/devcontainers/dotnet:1-8.0

# Install .NET 9 SDK on top
COPY --from=mcr.microsoft.com/dotnet/sdk:9.0 /usr/share/dotnet /usr/share/dotnet

# Install Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Install PostgreSQL client tools
RUN apt-get update && apt-get install -y postgresql-client

# Install EF Core tools globally
RUN dotnet tool install --global dotnet-ef
ENV PATH="${PATH}:/root/.dotnet/tools"
