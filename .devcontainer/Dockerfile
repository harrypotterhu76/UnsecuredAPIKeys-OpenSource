FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install .NET 9 SDK
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --channel 9.0 \
    && rm dotnet-install.sh

ENV PATH="${PATH}:/root/.dotnet"
ENV DOTNET_ROOT="/root/.dotnet"

# Install Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Install PostgreSQL client tools
RUN apt-get update && apt-get install -y postgresql-client

# Install EF Core tools
RUN dotnet tool install --global dotnet-ef
ENV PATH="${PATH}:/root/.dotnet/tools"
