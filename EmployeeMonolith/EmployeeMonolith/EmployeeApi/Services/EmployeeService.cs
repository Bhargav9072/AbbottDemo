using System.Collections.Generic;
using System.Threading.Tasks;
using EmployeeApi.Data;
using EmployeeApi.Models;

namespace EmployeeApi.Services
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IEmployeeRepository _repository;

        public EmployeeService() : this(new EmployeeRepository()) { }

        public EmployeeService(IEmployeeRepository repository)
        {
            _repository = repository;
        }

        public Task<IEnumerable<Employee>> GetAllEmployeesAsync() => _repository.GetAllAsync();

        public Task<Employee> GetEmployeeByIdAsync(int id) => _repository.GetByIdAsync(id);
    }
}
