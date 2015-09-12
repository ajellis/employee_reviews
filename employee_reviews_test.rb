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

  def test_employee_reviews
    andrew = Employee.new("andrew", "pyton_user@yahoo.com", "(919)987-6543", 500000)
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 1000000)
    janice = Employee.new("Janice", "some.email@yahoo.com", "(919)000-0000", 500000)
    ashley.review = "Ashley does a very good job packaging. She is a fantastic employee. She is always on time to work, and she never complains. "
    andrew.review = "Andrew is not very good at packaging, but I can tell that he is working to improve. Even thought the job is a struggle for him at times, he always comes to work with a smile. if given time to improve, I believe he could be very good."
    janice.review = "Janice is awful at packaging. She has been with the company for 8 months, and she still needs constant reminders about labeling practices. Very rarely is she on time to work, and she does not seem interested in trying to get better."
    assert_equal ashley.review, "Ashley does a very good job packaging. She is a fantastic employee. She is always on time to work, and she never complains. "
    assert_equal andrew.review, "Andrew is not very good at packaging, but I can tell that he is working to improve. Even thought the job is a struggle for him at times, he always comes to work with a smile. if given time to improve, I believe he could be very good."
    assert_equal janice.review, "Janice is awful at packaging. She has been with the company for 8 months, and she still needs constant reminders about labeling practices. Very rarely is she on time to work, and she does not seem interested in trying to get better."
  end

  def test_satisfactory
    andrew = Employee.new("andrew", "pyton_user@yahoo.com", "(919)987-6543", 500000)
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 1000000)
    janice = Employee.new("Janice", "some.email@yahoo.com", "(919)000-0000", 500000)
    ashley.satisfactory = true
    andrew.satisfactory = true
    janice.satisfactory = false
    assert ashley.satisfactory?
    assert andrew.satisfactory?
    refute janice.satisfactory?
  end

  def test_employee_raise
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 1000000)
    assert_equal ashley.new_salary, 1500000
  end


end
