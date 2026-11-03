# EmployeeMonolith (ASP.NET Web API, .NET Framework 4.8 + PostgreSQL)

## Setup
1. Run the SQL scripts in `database/` (01 then 02).
2. Edit the `EmployeeDb` connection string in `EmployeeApi/Web.config`.
3. Open `EmployeeMonolith.sln` in Visual Studio 2019/2022, restore NuGet packages, press F5.

## Endpoints
- GET /api/employees        -> all employees
- GET /api/employees/{id}   -> single employee
