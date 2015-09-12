require 'minitest/autorun'
require 'minitest/pride'
require './employee_reviews'

class DepartmentTest < Minitest::Test
  def test_initialize
    assert Department.new("shipping", "Ashley")
    assert_raises(ArgumentError) do
      Department.new
    end
    assert_raises(ArgumentError) do
      Department.new(1, 2, 3)
    end
  end

  def test_employee
    assert Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", "1,000,000")
    assert_raises (ArgumentError) do
      Employee.new
    end
    assert_raises(ArgumentError) do
      Employee.new("Ashley")
    end
    assert_raises(ArgumentError) do
      Employee.new("Ashley", "sully_master@yahoo.com")
    end
    assert_raises(ArgumentError) do
      Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567")
    end
  end

  def test_add_employees
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", "1,000,000")
    department = Department.new("shipping", [ashley])
    assert department.employees.include? ashley
  end

  def test_get_employees_name
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", "1,000,000")
    assert_equal ashley.name, "Ashley"
    refute_equal ashley.name, "sullymaster@yahoo.com"
  end

  

end
