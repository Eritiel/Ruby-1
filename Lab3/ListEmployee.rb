require_relative "Employee"
require_relative "WorkDB"
require 'openssl'
require 'base64'
require 'yaml'
require 'json'
class ListEmployee
  def initialize
    @emp_list = []
  end

  def add(employee)
    @emp_list << employee
    add_to_DB(employee)
  end

  def read_DB
    @emp_list = WorkDB.get_instance.read_list
  end

  def add_to_DB(emp)
     WorkDB.get_instance.add_employee(emp)
  end

  def delete_from_DB(emp)
     WorkDB.get_instance.delete_employee(emp)
  end

   def change_node(emp)
    WorkDB.get_instance.change_emp(emp)
  end

  def to_s
       @emp_list.each{|user| user.to_s}
   end

  def delete_employee(employee)
    @emp_list.delete(employee)
  end


  def search(data)
        @emp_list.each{ |emp| if [emp.name, emp.mail, emp.phone, emp.passport].include? data
        return emp
      else return nil
      end
    }
    end


      def encrypt_string(str)
        cipher_salt1 = 'some-random-salt-'
        cipher_salt2 = 'another-random-salt-'
        cipher = OpenSSL::Cipher.new('AES-128-ECB').encrypt
        cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
        encrypted = cipher.update(str) + cipher.final
        encrypted.unpack('H*')[0].upcase
      end

      def decrypt_string(encrypted_str)
        cipher_salt1 = 'some-random-salt-'
        cipher_salt2 = 'another-random-salt-'
        cipher = OpenSSL::Cipher.new('AES-128-ECB').decrypt
        cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
        decrypted = [encrypted_str].pack('H*').unpack('C*').pack('c*')

        cipher.update(decrypted) + cipher.final
      end

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

        def write_list_YAML
          File.open("employee.yml", "w:utf-8") { |file| file.write(@emp_list.to_yaml) }
        end

        def read_list_YAML
          @emp_list = YAML::load(File.open('employee.yml', 'r:UTF-8'))
        end


      def write_list_JSON
  		    File.open("employee.json","w:UTF-8") do |file|
  			       tempHash = {}
  			          @emp_list.each_with_index do |emp, ind|
  				              tempHash[ind] = {
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

    def read_list_JSON
		    File.open("employee.json", 'r:UTF-8') do |file|
			       data = JSON.parse(file.read)
			          data.each do |key, value|
				              if value["exp"]!='0'
					                   emp = Employee.new(value["fullname"], value["datebirth"], value["phone"], value["address"],
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
						user[4], user[5], user[6], user[7], user[8], user[9], user[10]))
				else
					add(Employee.employee_without_experience(user[0], user[1], user[2], user[3],
						user[4], user[5], user[6]))
          end
        end
      end
end
