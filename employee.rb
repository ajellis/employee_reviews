

class Employee
  attr_reader :name, :email, :phone
  attr_accessor :review, :satisfactory, :salary

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = nil
    @satisfactory = nil
  end

  def satisfactory?
    positive_review = review.scan(/positive | good | effective | consistent | satisfied | asset | pleasure/)
    negative_review = review.scan(/concern | concerns | trouble | tendency | negative | difficult |inadequate/)
    if positive_review.count > negative_review.count
      @satisfactory = true
    elsif
      negative_review.count > positive_review.count
      @satisfactory = false
    end
    return @satisfactory
  end

  def new_salary
    new_salary = salary*1.50
  end
end
