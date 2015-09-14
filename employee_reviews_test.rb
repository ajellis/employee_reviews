require 'minitest/autorun'
require 'minitest/pride'
require './department'
require './employee'

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
    assert_equal 500000, andrew.salary
    refute_equal "(919)987-6543", andrew.salary
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
    andrew.review = "Andrew is not very good at packaging, but I can tell that he is working to improve. Even though the job is a struggle for him at times, he always comes to work with a smile. if given time to improve, I believe he could be very good."
    janice.review = "Janice is awful at packaging. She has been with the company for 8 months, and she still needs constant reminders about labeling practices. Very rarely is she on time to work, and she does not seem interested in trying to get better."
    assert_equal ashley.review, "Ashley does a very good job packaging. She is a fantastic employee. She is always on time to work, and she never complains. "
    assert_equal andrew.review, "Andrew is not very good at packaging, but I can tell that he is working to improve. Even though the job is a struggle for him at times, he always comes to work with a smile. if given time to improve, I believe he could be very good."
    assert_equal janice.review, "Janice is awful at packaging. She has been with the company for 8 months, and she still needs constant reminders about labeling practices. Very rarely is she on time to work, and she does not seem interested in trying to get better."
  end

  def test_employee_raise
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 1000000)
    assert_equal 1500000, ashley.new_salary
  end


  def test_pass_block_dep_raise
    andrew = Employee.new("Andrew", "pyton_user@yahoo.com", "(919)987-6543", 50000)
    ashley = Employee.new("Ashley", "sully_master@yahoo.com", "(919)123-4567", 120000)
    janice = Employee.new("Janice", "some.email@yahoo.com", "(919)000-0000", 75000)
    ryan = Employee.new("Ryan", "some_other.email@yahoo.com", "(919)111-1111", 100000)
    department = Department.new("shipping", [andrew, ashley, janice])
    department.dep_raise(5000) do |employee|
      employee.salary < 100000
    end
    assert_equal 120000, ashley.salary
    assert_equal 100000, ryan.salary
    assert_equal 77500, janice.salary
    assert_equal 52500, andrew.salary
  end

  def test_if_employee_is_satisfactory
    zeke = Employee.new("Zeke", "blahblahblah@yahoo.com", "(919)123-4567", 50000)
    wanda = Employee.new("Wanda", "blahblahblah@yahoo.com", "(919)123-4567", 50000)
    yvonne = Employee.new("Yvonne", "blahblahblah@yahoo.com", "(919)123-4567", 50000)
    xavier = Employee.new("Xavier", "blahblahblah@yahoo.com", "(919)123-4567", 50000)
    zeke.review = "Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion.

Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further." #<----- negative

  wanda.review = "Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread her effectiveness to other projects." # <---- positive

  yvonne.review = "Thus far, there have been two concerns over Yvonne's performance, and both have been discussed with her in internal meetings.  First, in some cases, Yvonne takes longer to complete tasks than would normally be expected.  This most commonly manifests during development on existing applications, but can sometimes occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate for these preferences, Yvonne has been putting more time into fewer projects, which has gone well.

  Second, while in conversation, Yvonne has a tendency to interrupt, talk over others, and increase her volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the client or other attendees have clearly ruled the issue out, and can sometimes get off topic." #<-- negative

  xavier.review = "Xavier is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have to go
# 
  Last year, the only concerns with Xavier performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for." #<--- positive
    assert_equal zeke.satisfactory?, false
    assert_equal yvonne.satisfactory?, false
    assert_equal xavier.satisfactory?, true
    assert_equal wanda.satisfactory?, true
  end


end
