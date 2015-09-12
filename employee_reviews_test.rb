require 'minitest/autorun'
require 'minitest/pride'
require './employee_reviews'

class DepartmentTest < Minitest::Test
  def test_initialize
    assert Department.new("shipping")
    assert_raises(ArgumentError) do
      Department.new
    end
    assert_raises(ArgumentError) do
      Department.new(1, 2, 3)
    end
  end
end
