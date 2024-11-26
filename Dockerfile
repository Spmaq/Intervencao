# Para rodar o backend NumeracaoAPI.dll com o .NET Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar os arquivos de publicação do backend
COPY ../IntervencaoAPI /app

# Expor a porta do Nginx
EXPOSE 80

# Especificar o comando para rodar a aplicação
ENTRYPOINT ["dotnet", "NumeracaoAPI.dll"]

# # Usar o Nginx para servir o frontend
# FROM nginx:alpine AS web

# # Copiar os arquivos do frontend para o diretório padrão do Nginx
# COPY ../ /usr/share/nginx/html



# # Comando padrão para rodar o Nginx
# CMD ["nginx", "-g", "daemon off;"]