class Employee
  attr_reader :name, :email, :phone, :salary
  attr_accessor :review, :satisfactory

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = nil
    @satisfactory = nil
  end

  def satisfactory?
    return @satisfactory
  end

  def new_salary
    new_salary = salary*1.50
  end
end
