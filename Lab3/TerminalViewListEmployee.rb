require_relative "Employee"
class TerminalViewListEmployee
  def initialize
    @employee_list = Array.new
  end
  def add_emp_list
    puts "Введите данные сотрудника: "
    puts "ФИО сотрудника: "
    name=Employee.name_format(gets.chomp)
    return @employee_list.push(name)
  end
  def show_emp_list
    puts "Список пользователей: "
    @employee_list.each{|emp| emp.output}
  end
end
