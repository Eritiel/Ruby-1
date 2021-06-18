require_relative "Employee"
require_relative "WorkDB"
require 'openssl'
require 'base64'
require 'yaml'
require 'json'

#Класс для хранения списка сотрудников.
class ListEmployee
  #Создает пустой список +emp_list+.
  def initialize
    @emp_list = []
  end

  #Добавляет сотрудника и в список, и в базу данных.
  # === Аргументы
  # *_employee_ - объект класса Employee, поля которого добавляются в список emp_list
  def add(employee)
    @emp_list << employee
  end

  def get_element(ind)
    @emp_list[ind]
  end

  #Читает информацию о сотруднике из базы данных.
  def read_DB
    @emp_list = WorkDB.get_instance.read_list
  end

  #Добавляет информацию о сотруднике в базу данных.
  # === Аргументы
  # * _id_ - номер сотрудника
  # * _name_ - имя сотрудника
  # * _birth_ - дата рождения сотрудника
  # * _phone_ - телефон сотрудника
  # * _address_ - адрес сотрудника
  # * _mail_ - электронная почта сотрудника
  # * _spec_ - специальность сотрудника
  # * _exp_ - опыт работы
  # * _last_job_name_ - предыдущее место работы
  # * _last_job_spec_ - должность на предыдущем месте работы
  # * _last_job_salary_ - заработная плата на прошлом месте работы
  def add_to_DB(id, name, birth, phone, address, mail, passport, spec, exp, last_job_name, last_job_spec, last_job_salary)
     WorkDB.get_instance.add_employee(id, name, birth, phone, address, mail, passport, spec, exp, last_job_name, last_job_spec, last_job_salary)
  end

  #Удаляет информацию о сотруднике из базы данных
  # === Аргументы
  # * _emp_ - объект класса Employee
  def delete_from_DB(emp)
     WorkDB.get_instance.delete_emp(emp)
     @emp_list = []
     read_DB()
  end

  #Изменяет информацию о выбранном сотруднике в базе данных.
  # === Аргументы
  # * _emp_ - объект класса Employee
   def change_node(emp)
    WorkDB.get_instance.change_emp(emp)
  end

  #Осуществялет представление элемента списка сотрудников +emp_list+ в виде форматированной строки.
  def to_s
       @emp_list.each{|user| user.to_s}
   end

  #Удаляет элемент из списка сотрудников +emp_list+.
  # == Аргументы
  # * _employee_ - элемент списка
  def delete_employee(employee)
    @emp_list.delete(employee)
  end

  def each_list(&block)
    @emp_list.each(&block)
  end

  def list_length
    @emp_list.length
  end

  #Осуществляет поиск сотрудника по имени, адресу электронной почты или пасспортным данным в списке +emp_list+.
  #Если строка-запрос является подстрокой одного из полей +name+, +mail+ или +passport+, то возвращает объект с указанными полями. В противном случае возвращает +nil+.
  # === Аргументы
  # * _data_ - строка-запрос
  def search(data)
        @emp_list.each{ |emp| if [emp.name, emp.mail, emp.phone, emp.passport].include? data
        return emp
      else return nil
      end
    }
    end

    #Осуществляет кодирование строки.
    # === Аргументы
    # * _str_ - кодируемая строка
      def encrypt_string(str)
        cipher_salt1 = 'some-random-salt-'
        cipher_salt2 = 'another-random-salt-'
        cipher = OpenSSL::Cipher.new('AES-128-ECB').encrypt
        cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
        encrypted = cipher.update(str) + cipher.final
        encrypted.unpack('H*')[0].upcase
      end

      #Осуществляет декодирование строки.
      # === Аргументы
      # * _str_ - декодируемая строка
      def decrypt_string(encrypted_str)
        cipher_salt1 = 'some-random-salt-'
        cipher_salt2 = 'another-random-salt-'
        cipher = OpenSSL::Cipher.new('AES-128-ECB').decrypt
        cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
        decrypted = [encrypted_str].pack('H*').unpack('C*').pack('c*')

        cipher.update(decrypted) + cipher.final
      end

      #Осуществляет запись объекта в файл формата txt.
      def write_file
        file = File.open('emp.txt', 'w:UTF8') {|file|
            @emp_list.each {|user|
              passport_code = encrypt_string(user.passport.join)
              file.write(user.name << ' || ' << user.birth << ' || ' << user.phone << ' || ' <<
      				      user.address << ' || ' << user.mail << ' || ' << passport_code.force_encoding('UTF-8') <<
      					 ' || ' << user.spec << ' || ' << user.exp)
      				unless user.exp == "0"
      					file.write(' || ' << user.last_job_name << ' || ' << user.last_job_spec << ' || ' << user.last_job_salary)
      				end
              file.write("\n")
            }
          }
        end

        #Осуществляет запись объекта в файл формата YAML.
        def write_list_YAML
          File.open("employee.yml", "w:utf-8") { |file| file.write(@emp_list.to_yaml) }
        end

        #Осуществляет чтение объекта из файла формата YAML.
        def read_list_YAML
          @emp_list = YAML::load(File.open('employee.yml', 'r:UTF-8'))
        end

      #Осуществляет запись объекта в файл формата JSON.
      def write_list_JSON
  		    File.open("employee.json","w:UTF-8") do |file|
  			       tempHash = {}
  			          @emp_list.each_with_index do |emp, ind|
  				              tempHash[ind] = {
                                "id": emp.id,
  					                   "fullname": emp.name,
                      					"datebirth": emp.birth,
                      					"phone": emp.phone,
                      					"address": emp.address,
                      					"email": emp.mail,
                      					"passport": emp.passport.join,
                      					"speciality": emp.spec,
                      					"experience": emp.exp,
                      					"last_job": emp.last_job_name,
                      					"last_job_spec": emp.last_job_spec,
                      					"last_job_salary": emp.last_job_salary
  				                        }
  			                      end
  			file.write(JSON.pretty_generate(tempHash))
  		end
	   end

    #Осуществляет чтение объекта из файла формата JSON.
    def read_list_JSON
		    File.open("employee.json", 'r:UTF-8') do |file|
			       data = JSON.parse(file.read)
			          data.each do |key, value|
				              if value["exp"]!='0'
					                   emp = Employee.new(value["id"], value["fullname"], value["datebirth"], value["phone"], value["address"],
														 value["email"], value["passport"], value["speciality"], value["experience"],
														 value["last_job"], value["last_job_spec"], value["last_job_salary"])
				                       else
					                            emp = Employee.new(value["full"], value["datebirth"], value["phone"], value["address"],
														 value["email"], value["passport"], value["speciality"], value["experience"])
				                       end
			add(emp)
			end
		end
	end

        #Осуществляет чтение объекта из файла формата txt.
      def read_file
        file = File.open('emp.txt', 'r:UTF-8')
			  users = file.read
			  users = users.force_encoding("cp866")
			  users = users.split("\n")
			  users.each do |user|
				user = user.split(' || ')
				user.map { |elem| elem.force_encoding("UTF-8") }
				user[5] = decrypt_string(user[5])
				unless user[7] == "0"
					add(Employee.new(user[0], user[1], user[2], user[3],
						user[4], user[5], user[6], user[7], user[8], user[9], user[10], user[11]))
				else
					add(Employee.employee_without_experience(user[0], user[1], user[2], user[3],
						user[4], user[5], user[6], user[7]))
          end
        end
      end
end

a = ListEmployee.new()
a.read_DB
a.each_list{|emp| p emp}
