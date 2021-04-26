require_relative "Employee"
class ListEmployee
  attr_accessor :emp_list
  def initialize (emp_list = [])
    @emp_list = emp_list
  end

  def add(employee)
    @emp_list << employee
  end

  def delete(employee)
    @emp_list.pop(employee)
  end

  def search(arg, value)
        @emp_list.select { |emp| emp.method(arg).call == value }
    end

end
