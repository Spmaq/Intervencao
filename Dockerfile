# Imagem base do ASP.NET Runtime
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Imagem para compilar o projeto
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "IntervencaoAPI/IntervencaoAPI.csproj"
RUN dotnet publish "IntervencaoAPI/IntervencaoAPI.csproj" -c Release -o /app/build

# Finalização do ambiente
FROM base AS final
WORKDIR /app
COPY --from=build /app/build .
ENTRYPOINT ["dotnet", "IntervencaoAPI.dll"]