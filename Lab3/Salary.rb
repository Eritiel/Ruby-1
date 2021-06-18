class Salary

  def get_salary

  end
end

class SalaryDecorator < Salary
  def initialize(salary, salary_with_bonus)
    @salary = salary
    @salary_with_bonus = salary_with_bonus
  end
  def get_salary
    @salary.get_salary
  end
end

class FixedSalary < Salary
  def initialize salary
    @salary = salary
  end
  def get_salary
    @salary
  end
end

class PossibleBonus < SalaryDecorator
  def get_salary
  super * (@salary_with_bonus/100.00 + 1)
  end
end

class QuarterlyAward < SalaryDecorator
  def get_salary

    super * (1 + @salary_with_bonus/100.00)
  end
end

class FixedPremium < SalaryDecorator

  def get_salary
    super + @salary_with_bonus
  end
end

new_salary = Salary.new()
new_salary = QuarterlyAward.new(PossibleBonus.new(FixedPremium.new(FixedSalary.new(50000), 5000),20),5)
puts new_salary.get_salary
