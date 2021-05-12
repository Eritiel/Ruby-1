require_relative 'Actor'
require_relative 'ActorList'
require 'openssl'
require 'base64'
class ViewActorList
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
    puts "Паспортные данные сотрудника: "
    passport = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Название пьесы:"
    play_name = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Роль актера: "
    role =  STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Начало действия контракта #{name}: "
    contract_start = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Конец действия контракта #{name}: "
    contract_end =  STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    puts "Опыт: "
    exp=STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil).to_i
    unless exp == 0 then
      puts "Профессиональные заслуги: "
      degree= STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
      puts "Дополнительные выплаты: "
      additional_payment = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)

      actor = Employee.new(name, birth, phone, address, passport, play_name, role, contract_start, contract_end, exp, degree, additional_payment)
    else
      actor = Employee.employee_without_experience(name, birth, phone, address, passport, play_name, role, contract_start, contract_end)
    end
      @employee_list.add(actor)
  end

  def delete_emp
    puts "Введите имя сотрудника, которого хотите удалить: "
    target_actor= STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    actor = @employee_list.search(target_actor)
    puts(actor.to_s)
    puts("Вы уверены, что хотите удалить сотрудника? [Да/Нет]")
    answer = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil).downcase
    @employee_list.delete_employee(actor) if answer == "да"
  end

  def edit_contract_date
    show_emp_list()
    puts "Введите имя актера, с которым хотите изменить длительность контракта: "
    target_actor= STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
    actor = @employee_list.search(target_actor)
    puts "Введите поле для редактирования: "
    puts "1 - Дата начала действия контракта"
    puts "2 - Дата истечения действия контракта"
    arg = STDIN.gets.chomp()
    case arg
    when "1"
      puts "Текущее значение: #{actor.contract_start}"
      actor.contract_start =  Employee.date_format(STDIN.gets.chomp)
    when "2"
      puts "Текущее значение: #{actor.contract_end}"
      actor.contract_end =  Employee.date_format(STDIN.gets.chomp)
    end
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
          puts "Введите ФИО, начало действия контракта, конец действия контракта, телефон или паспорт:"
          value =  STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil)
          if Employee.name_check value
              name = Employee.name_format(value)
              emp = @employee_list.search(name)
          end
          if Employee.birth_date_check value
              contract_start = Employee.date_format(value)
              emp = @employee_list.search(contract_start)
          end
          if Employee.birth_date_check value
              contract_end = Employee.date_format(value)
              emp = @employee_list.search(contract_end)
          end
          if Employee.number_check value
              phone = Employee.phone_format(value)
              emp = @employee_list.search(phone)
          end
          if Employee.passport_check value
              passport = Employee.passport_format(value)
              emp = @employee_list.search(passport)
          end
          puts emp
      end
end


empl = ViewActorList.new()
def menu emp
  puts "1. Добавить актера"
  puts "2. Удалить актера"
  puts "3. Посмотреть список задействованных актеров"
  puts "4. Запись в файл"
  puts "5. Чтение из файла"
  puts "6. Поиск актера"
  puts "7. Изменение длительности контракта"
  puts "8. Закрыть программу."
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
    emp.edit_contract_date
  when "8"
    exit()
  end
  menu(emp)
end
menu(empl)
