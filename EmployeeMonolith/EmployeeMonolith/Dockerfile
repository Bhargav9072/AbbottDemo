FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2022 AS build

WORKDIR C:/src

COPY . .

RUN nuget restore EmployeeMonolith.sln

RUN msbuild EmployeeApi\EmployeeApi.csproj /p:Configuration=Release

RUN dir EmployeeApi\bin

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2022

WORKDIR C:/inetpub/wwwroot

COPY --from=build C:/src/EmployeeApi .

EXPOSE 80