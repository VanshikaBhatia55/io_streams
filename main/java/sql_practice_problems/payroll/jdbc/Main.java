package sql_practice_problems.payroll.jdbc;

public class Main {
    public static void main(String[] args) {
        EmployeePayrollDBService employeePayrollDBService = new EmployeePayrollDBService();
        employeePayrollDBService.getEmployeePayrollData();
    }
}
