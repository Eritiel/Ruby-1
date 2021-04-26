require_relative "Employee"
class ListEmployee
  attr_accessor :emp_list
  def initialize (emp_list = [])
    @emp_list = emp_list
  end

  def add(employee)
    @emp_list.push(employee)
  end
  def delete(employee)
    @emp_list.pop(employee)
  end
  
end
