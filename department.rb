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
    satisfactory_count = 0
    employees.each do |employee|
      if employee.satisfactory? == true
        satisfactory_count += 1
      end
    end
    individual_raise = amount / satisfactory_count

    employees.each do |employee|
      if employee.satisfactory == true
        employee.salary += individual_raise
      end
    end
  end



end
