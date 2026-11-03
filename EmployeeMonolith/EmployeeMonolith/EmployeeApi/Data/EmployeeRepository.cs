using System.Collections.Generic;
using System.Configuration;
using System.Threading.Tasks;
using System.Data;
using Dapper;
using EmployeeApi.Models;
using Npgsql;

namespace EmployeeApi.Data
{
    public class EmployeeRepository : IEmployeeRepository
    {
        private const string SelectColumns = @"
            employee_id, employee_code, first_name, last_name, email, phone_number,
            department, designation, hire_date, is_active, created_at, updated_at";

        private readonly string _connectionString =
            ConfigurationManager.ConnectionStrings["EmployeeDb"].ConnectionString;

        public async Task<IEnumerable<Employee>> GetAllAsync()
        {
            var sql = "SELECT " + SelectColumns + " FROM employees ORDER BY employee_id;";
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                return await conn.QueryAsync<Employee>(sql);
            }
        }

        public async Task<Employee> GetByIdAsync(int id)
        {
            var sql = "SELECT " + SelectColumns + " FROM employees WHERE employee_id = @id;";
            using (var conn = new NpgsqlConnection(_connectionString))
            {
                return await conn.QueryFirstOrDefaultAsync<Employee>(sql, new { id });
            }
        }
    }
}
