require_relative "Employee"
class TerminalViewListEmployee
  attr_accessor :employee_list
  def initialize (employee_list = [])
    @employee_list = employee_list
  end
  def add_emp_list
    puts "Введите данные сотрудника: "
    puts "ФИО сотрудника: "
    name = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Дата рождения сотрудника: "
    birth = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Телефон сотрудника: "
    phone = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Адрес сотрудника: "
    address = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Email сотрудника: "
    mail = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Паспортные данные сотрудника: "
    passport = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Специальность сотрудника: "
    spec = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Опыт: "
    exp=STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil).to_i
    unless exp == 0 then
      puts "Прошлое место работы: "
      last_job_name = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
      puts "Должность на прошлом месте работы: "
      last_job_spec = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
      puts "Заработная плата на прошлом месте работы: "
      last_job_salary = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)

      employee=Employee.new(name, birth, phone, address, mail, passport, spec, exp, last_job_name, last_job_spec, last_job_salary)
    else
      employee=Employee.new(name, birth, phone, address, mail, passport, spec, exp)
    end
      @employee_list.push(employee)
  end
  def show_emp_list
    puts "Список пользователей: "
      @employee_list.each{|emp| emp.output}
  end
end
emp = TerminalViewListEmployee.new
emp.show_emp_list
