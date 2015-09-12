require './employee'
class Department
  attr_reader :employees, :dep_name

  def initialize(dep_name, employees= [])
    @dep_name = dep_name
    @employees = employees
  end
end
