require_relative "Actor"
require 'openssl'
require 'base64'
class ListEmployee
  attr_accessor :emp_list
  def initialize
    @emp_list = []
  end

  def add(employee)
    @emp_list << employee
  end

  def delete_employee(employee)
    @emp_list.delete(employee)
  end

  def search(data)
        @emp_list.each{ |emp| if [emp.name, emp.phone, emp.passport, emp.contract_start, emp.contract_end].include? data
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
      file = File.open('actor.txt', 'w:utf-8') {|file|
    			@emp_list.each {|user|
    				passport_code = encrypt_string(user.passport.join)
    				file.write(user.name << ' || ' << user.birth << ' || ' << user.phone << ' || ' <<
    				      user.address << ' || ' << passport_code.force_encoding('UTF-8') <<
    					 ' || ' << user.play_name << ' || '<< user.role << ' || ' << user.contract_start << ' || ' << user.contract_end << ' || ' << user.exp)
    				unless user.exp = "0"
    					file.write( user.degree << ' || ' << user.additional_payment)
    				end
    				file.write("\n")
    			}
    		}
    	end

      def read_file

        file = File.open('actor.txt', 'r:UTF-8')
			  users = file.read
			  users = users.force_encoding("cp866")
			  users = users.split("\n\n")
			  users.each do |user|
				user = user.split(' || ')
				user.map { |elem| elem.force_encoding("UTF-8") }
				user[4] = decrypt_string(user[4])
				unless user[9] = "0"
					add(Employee.new(user[0], user[1], user[2], user[3],
						user[4], user[5], user[6], user[7], user[8], user[9], user[10], user[11]))
				else
					add(Employee.employee_without_experience(user[0], user[1], user[2], user[3],
						user[4], user[5], user[6], user[7], user[8]))
          end
        end
      end
end
