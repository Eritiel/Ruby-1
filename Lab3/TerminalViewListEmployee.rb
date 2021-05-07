require_relative 'Employee'
require_relative 'ListEmployee'
require 'openssl'
require 'base64'
class TerminalViewListEmployee
  attr_accessor :employee_list
  def initialize (employee_list = ListEmployee.new())
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

      employee = Employee.new(name, birth, phone, address, mail, passport, spec, exp, last_job_name, last_job_spec, last_job_salary)
    else
      employee = Employee.employee_without_experience(name, birth, phone, address, mail, passport, spec)
    end
      @employee_list.add(employee)
  end

  def delete_emp
    puts "Введите имя сотрудника, которого хотите удалить: "
    target_emp = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    employee = @employee_list.search(target_emp)
    puts(employee.to_s)
    puts("Вы уверены, что хотите удалить сотрудника? [Да/Нет]")
    answer = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil).downcase
    @employee_list.delete_employee(employee) if answer == "да"
  end

  def show_emp_list
    puts "Список пользователей: "
    puts @employee_list.emp_list
  end

  def file_export
  @employee_list.write_file()
  end

  def file_read
  @employee_list.read_file
  end

  def search_employee
          puts "Введите ФИО, электронную почту, телефон или паспорт:"
          value =  STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
          if Employee.name_check value
              name = Employee.name_format(value)
              emp = @employee_list.search(name)
          end
          if Employee.email_check value
              mail = Employee.email_format(value)
              emp = @employee_list.search(mail)
          end
          if Employee.number_check value
              phone = Employee.phone_format(value)
              emp = @employee_list.search( phone)
          end
          if Employee.passport_check value
              passport = Employee.passport_format(value)
              emp = @employee_list.search(passport)
          end
          puts emp
      end
end


empl = TerminalViewListEmployee.new()
def menu emp
  puts "1. Добавить пользователя."
  puts "2. Удалить пользователя"
  puts "3. Посмотреть список пользователей"
  puts "4. Запись в файл"
  puts "5. Чтение из файла"
  puts "6. Поиск сотрудника"
  puts "7. Закрыть программу."
  method =  STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
  case method
  when "1"
    emp.add_emp_list()
  when "2"
    emp.delete_emp()
  when "3"
    emp.show_emp_list()
  when "4"
    emp.file_export()
  when "5"
    emp.file_read()
  when "6"
    emp.search_employee()
  when "7"
    exit()
  end
  menu(emp)
end
menu(empl)
