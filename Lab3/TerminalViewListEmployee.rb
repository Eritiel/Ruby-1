require_relative 'Employee'
require_relative 'ListEmployee'
require 'openssl'
require 'base64'
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

      employee = Employee.new(name, birth, phone, address, mail, passport, spec, exp, last_job_name, last_job_spec, last_job_salary)
    else
      employee = Employee.employee_without_experience(name, birth, phone, address, mail, passport, spec)
    end
      @employee_list.add(employee)
  end
  def delete_emp
    employee = @employee_list [0]
    puts(employee.to_s)
    puts("Удалить? [Да/Нет]")
    answer = STDIN.gets.chomp.force_encoding("cp866").encode("utf-8", replace: nil).downcase
    @employee_list.delete(employee) if answer == "да"
  end

  def show_emp_list
    puts "Список пользователей: "
    @employee_list.each_with_index{|emp, i|  "№#{i+1}."; puts emp}
  end

  def file_export
    key = OpenSSL::PKey::RSA.new 2048
    open 'public.pem', 'w' do |io| io.write key.public_key.to_pem end
    public_key_file = 'public.pem'
    public_key = OpenSSL::PKey::RSA.new(File.read(public_key_file))
    file = File.open('emp.txt', 'a:UTF-8')
    @employee_list.each_with_index{|emp, index| file.puts "#{index+1}. #{emp}"}
    file.close
  end
  def file_read
    file = File.open('emp.txt', 'r:UTF-8') {|file| file.read}
    @employee_list.push(file)
  end

end
empl = TerminalViewListEmployee.new
def menu emp
  puts "1. Добавить пользователя."
  puts "2. Удалить пользователя"
  puts "3. Посмотреть список пользователей"
  puts "4. Запись в файл"
  puts "5. Чтение из файла"
  puts "6. Закрыть программу."
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
    exit()
  end
  menu(emp)
end
menu(empl)
