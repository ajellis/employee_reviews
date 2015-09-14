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

  def dep_raise(amount)
    employees_for_raise = employees.select do |employee|
      yield(employee)
    end
    individual_raise = amount / employees_for_raise.count

    employees_for_raise.each do |employee|
    employee.salary += individual_raise
    end
  end



end
