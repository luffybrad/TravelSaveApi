FROM mcr.microsoft.com/dotnet/sdk:latest AS build
WORKDIR /src
COPY ["TravelSave.csproj", "."]
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:latest
WORKDIR /app
EXPOSE 80
EXPOSE 443
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "TravelSave.dll"] 