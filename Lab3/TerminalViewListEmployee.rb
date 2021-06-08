require_relative 'Employee'
require_relative 'ListEmployee'
require 'json'
require 'yaml'
require 'mysql2'
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
    exp=STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    unless exp == "0" then
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
    puts @employee_list.to_s
  end

  def file_export
    @employee_list.write_file()
  end

  def file_read
    @employee_list.read_file()
  end

  def yaml_test_write
    @employee_list.write_list_YAML()
  end

  def yaml_test_read
    @employee_list.read_list_YAML()
  end

  def json_test_write
    @employee_list.write_list_JSON()
  end

  def json_test_read
    @employee_list.read_list_JSON()
  end

  def test_write_DB
    @employee_list.write_list_JSON()
  end

  def test_read_DB
    @employee_list.read_DB
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
      def edit_emp_data
        show_emp_list()
        puts "Введите имя сотрудника, данные которого хотите изменить: "
        target_emp= STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
        emp = @employee_list.search(target_emp)
        puts "Введите поле для редактирования: "
        puts "1 - ФИО"
        puts "2 - Дата рождения"
        puts "3 - Номер телефона"
        puts "4 - Адрес "
        puts "5 - E-mail"
        puts "6 - Паспортные данные"
        puts "7 - Специальность"
        puts "8 - Опыт"
        unless emp.exp == "0" then
          puts "9 - Предыдущее место работы"
          puts "10 - Должность на предыдущем месте работы"
          puts "11 - Зарплата на прошлом месте работе"
        else puts "."
        end
        arg = STDIN.gets.chomp()
        case arg
        when "1"
          puts "Текущее значение: #{emp.name}"
          emp.name =  Employee.name_format(STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil))
        when "2"
          puts "Текущее значение: #{emp.birth}"
          emp.birth =  Employee.date_format(STDIN.gets.chomp)
        when "3"
          puts "Текущее значение: #{emp.phone}"
          emp.phone = Employee.phone_format(STDIN.gets.chomp)
        when "4"
          puts "Текущее значение: #{emp.address}"
          emp.address = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
        when "5"
          puts "Текущее значение: #{emp.mail}"
          emp.mail = Employee.email_format(STDIN.gets.chomp)
        when "6"
          puts "Текущее значение: #{emp.passport}"
          emp.passport = Employee.passport_format(STDIN.gets.chomp)
        when "7"
          puts "Текущее значение: #{emp.spec}"
          emp.spec = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
        when "8"
          puts "Текущее значение: #{emp.exp}"
          emp.exp = STDIN.gets.chomp
        else
          unless emp.exp == "0" then
            case arg
            when "9"
              puts "Текущее значение: #{emp.last_job_name}"
              emp.last_job_name = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
            when "10"
              puts "Текущее значение: #{emp.last_job_spec}"
              emp.last_job_spec = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
            when "11"
              puts "Текущее значение: #{emp.last_job_salary}"
              emp.last_job_salary = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
            end
          end
        end
      end
end


empl = TerminalViewListEmployee.new()
def menu emp
  puts "1. Добавить пользователя."
  puts "2. Удалить пользователя"
  puts "3. Посмотреть список пользователей"
  puts "4. Запись в файл"
  puts "5. Чтение из файла"
  puts "6. Запись в YAML"
  puts "7. Чтение из YAML"
  puts "8. Запись в JSON"
  puts "9. Чтение из JSON"
  puts "10. Поиск сотрудника"
  puts "11. Изменить данные сотрудника"
  puts "12. Прочитать из БД"
  puts "13. Закрыть программу."
  method = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
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
    emp.yaml_test_write()
  when "7"
    emp.yaml_test_read()
  when "8"
    emp.json_test_write()
  when "9"
    emp.json_test_read()
  when "10"
    emp.search_employee()
  when "11"
    emp.edit_emp_data()
  when "12"
    emp.test_read_DB()
  when "13"
    exit()
  end
  menu(emp)
end
menu(empl)
