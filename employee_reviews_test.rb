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
end
