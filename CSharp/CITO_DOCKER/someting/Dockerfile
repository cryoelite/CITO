#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["someting/someting.csproj", "someting/"]
RUN dotnet restore "someting/someting.csproj"
COPY . .
WORKDIR "/src/someting"
RUN dotnet build "someting.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "someting.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "someting.dll"]
