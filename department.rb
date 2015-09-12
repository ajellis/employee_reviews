require './employee'
class Department
  attr_reader :employees

  def initialize(dep_name, employees= [])
    @employees = employees
  end
end
