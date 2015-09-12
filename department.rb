require './employee'
class Department
  attr_reader :employees, :dep_name

  def initialize(dep_name, employees= [])
    @dep_name = dep_name
    @employees = employees
  end

  def total_salary
    salaries = 0
    employees.each do |employee|
      salaries += employee.salary
    end
    return salaries
  end
end
