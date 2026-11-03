import { CommonModule } from '@angular/common';
import { HttpErrorResponse } from '@angular/common/http';
import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Employee } from './employee.model';
import { EmployeeService } from './employee.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './employee-directory.component.html'
})
export class AppComponent {
  private readonly employeeService = inject(EmployeeService);

  employees: Employee[] = [];
  loading = false;
  errorMessage = '';
  searchTerm = '';
  selectedDepartment = 'all';

  get filteredEmployees(): Employee[] {
    const query = this.searchTerm.trim().toLocaleLowerCase();
    return this.employees.filter((employee) => {
      const matchesDepartment = this.selectedDepartment === 'all'
        || employee.department === this.selectedDepartment;
      const searchableText = [
        employee.firstName,
        employee.lastName,
        employee.employeeCode,
        employee.email,
        employee.department,
        employee.designation
      ].join(' ').toLocaleLowerCase();
      return matchesDepartment && (!query || searchableText.includes(query));
    });
  }

  get departments(): string[] {
    return [...new Set(this.employees.map((employee) => employee.department))].sort();
  }

  get activeCount(): number {
    return this.employees.filter((employee) => employee.isActive).length;
  }

  get departmentCount(): number {
    return this.departments.length;
  }

  constructor() {
    this.loadEmployees();
  }

  loadEmployees(): void {
    this.loading = true;
    this.errorMessage = '';
    this.employeeService.getEmployees().subscribe({
      next: (employees) => {
        this.employees = employees;
        this.loading = false;
      },
      error: (error: HttpErrorResponse) => {
        this.errorMessage = error.status === 0
          ? 'Check that the employee API is running at localhost:51234, then try again.'
          : error.message || 'Please try again in a moment.';
        this.loading = false;
      }
    });
  }

  initials(employee: Employee): string {
    return `${employee.firstName.charAt(0)}${employee.lastName.charAt(0)}`.toLocaleUpperCase();
  }

  departmentClass(department: string): string {
    return `department-${department.toLocaleLowerCase().replace(/[^a-z0-9]+/g, '-')}`;
  }
}
