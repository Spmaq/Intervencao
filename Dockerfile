# Use a imagem do SDK do .NET para construir o projeto
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Defina o diretório de trabalho
WORKDIR /src

# Copie o arquivo .csproj para o contêiner
COPY ["IntervencaoAPI/IntervencaoAPI.csproj", "IntervencaoAPI/"]

# Restaure as dependências
RUN dotnet restore "IntervencaoAPI/IntervencaoAPI.csproj"

# Copie o restante dos arquivos
COPY . .

# Construa o projeto
RUN dotnet build "IntervencaoAPI/IntervencaoAPI.csproj" -c Release -o /app/build

# Publicação do projeto
RUN dotnet publish "IntervencaoAPI/IntervencaoAPI.csproj" -c Release -o /app/publish

# Use uma imagem do .NET Runtime para rodar o aplicativo
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

# Copie os arquivos publicados para a imagem final
COPY --from=build /app/publish .

# Defina o comando para iniciar a aplicação
ENTRYPOINT ["dotnet", "NumeracaoAPI.dll"]