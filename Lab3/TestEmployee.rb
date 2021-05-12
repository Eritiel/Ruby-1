require_relative "Employee"
require 'openssl'
class TestEmployee
  def menu()
    emp1 = Employee.new("темный кирилл владиславович","02.11.2000","89608635782","Сормовская","kirik201100@mail.ru","03 15 023262","Программистер","5","Макдак","Уборщик","5000")
    emp2 = Employee.new("Лупа - Пупа  пупа - пупа ахмед соглы","11.10.2000","79608642149","Тюляева","beep_boop@gmail.com","03 20 02-37-59","Лингвист","0","КФС","Кассир","7000")
    puts emp1
  end

end
emp1 = TestEmployee.new
emp1.menu

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
