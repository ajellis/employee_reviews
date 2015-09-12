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
    assert Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 1000000)
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
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 1000000)
    department = Department.new("shipping", [ashley])
    assert department.employees.include? ashley
  end

  def test_get_employees_name
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 1000000)
    assert_equal ashley.name, "Ashley"
    refute_equal ashley.name, "sullymaster@yahoo.com"
  end

  def test_get_employees_salary
    andrew = Employee.new("andrew", "pyton_user@yahoo.com", "(919)987-6543", 500000)
    assert_equal andrew.salary, 500000
    refute_equal andrew.salary, "(919)987-6543"
  end

  def test_get_department_name
    department = Department.new("shipping", ["Ashley"])
    assert_equal department.dep_name, "shipping"
    refute_equal department.dep_name, "Ashley"
  end

  def test_get_total_department_salary
    andrew = Employee.new("andrew", "pyton_user@yahoo.com", "(919)987-6543", 500000)
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 1000000)
    department = Department.new("shipping", [ashley, andrew])
    assert_equal department.total_salary, 1500000
  end

end
