using System.Collections.Generic;
using System.Threading.Tasks;
using EmployeeApi.Models;

namespace EmployeeApi.Data
{
    public interface IEmployeeRepository
    {
        Task<IEnumerable<Employee>> GetAllAsync();
        Task<Employee> GetByIdAsync(int id);
    }
}
