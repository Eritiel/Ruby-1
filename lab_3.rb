class Employee
  attr_reader :last_job,:last_job_salary,:phone,:mail,:name,:birth,:passport
  attr_accessor :address,:spec,:job_name,:exp
  def initialize (name, birth, phone, address, mail, passport, spec, exp, last_job, job_name, last_job_salary)
    @name=name
    @birth=birth
    @phone=phone
    @address=address
    @mail=mail
    @passport=passport
    @spec=spec
    @job_name=job_name
    self.check_exp(exp,last_job,last_job_salary)
  end
  def check_exp(new_exp,new_last_job,new_last_job_salary)
    @exp=new_exp
    unless new_exp==0
      @last_job=new_last_job
      @last_job_salary=new_last_job_salary
    end
  end
  def phone_setter()
    new_phone=gets.chomp
    @phone=new_phone if phone_format(new_phone)
  end
  def email_setter()
    new_mail=gets.chomp()
    @mail=new_mail if email_format(new_mail)
  end
  def name_setter()
    new_name=gets.chomp
    if name_format(new_name)
      @name=new_name
    end
  end
  def birth_date_setter()
    new_birth=gets.chomp
    @birth=new_birth if date_format(new_birth)
  end
  def passport_setter()
    new_passport=gets.chomp
    @passport=new_passport if passport_format(new_passport)
  end
  def number_check(phone)
    if phone=~/^(\+?[7]|[7])([-+()]*[0-9]{3}[-+()]*[0-9]{7}|[0-9]{10}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{4}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{2}[-+()]*[0-9]{2})\b/
      return true
    else
      return false
    end
  end
  def email_check(mail)
    if mail=~/^[\w\d]+@[\w\d]+\.[\w]+/
      return true
    else
      return false
    end
  end
  def name_check(name)
    if name=~/^(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*-[\s]*[a-zА-Яа-яA-Z]+)[\s]+(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*-[\s]*[a-zА-Яа-яA-Z]+)[\s]*(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*[a-zА-Яа-яA-Z]+[\s]*)$/
      return true
    else
      return false
    end
  end
  def birth_date_check(birth)
    if birth=~/^(?:0?[1-9]|[12]\d|3[01]).(?:0[1-9]|1[012]).(?:(19|20\d\d$)|(\d{2}$))/
      return true
    else
      return false
    end
  end
  def passport_check(passport)
    if passport=~/^(?:\d{4}|\d{2}[\s-]\d{2})\s?(?:\d{6}$|\d{2}[\s-]\d{2}[\s-]\d{2}$)/
      return true
    else
      return false
    end
  end
  def phone_format(phone)
    if number_check(phone) == false
      raise StandardError.new "Неверный формат телефона"
    else
      s=phone.scan(/[0-9]/)
      puts print "Телефон сотрудника: ",[s[0],s[1,3].join(),s[4,10].join()].join("-")
    end
  end
  def email_format(mail)
    if email_check(mail) == false
      raise StandardError.new "Неверный формат электронной почты"
    else
      s=mail.chars.map{|i| i.downcase}.join
      puts print "E-mail: ", s
    end
  end
  def name_format(name)
    if name_check(name) == false
      raise StandardError.new "Неверный формат имени"
    else
      s = name.downcase
      s = name.gsub(/\s\s+/, " ").gsub(/\b./, &:upcase).gsub(/(?<=[а-яa-zA-ZА-Я])\s-\s(?=[а-яa-zA-ZА-Я])/, "-")
      end
      puts print "Имя сотрудника: ",s
  end
  def date_format(birth)
    if birth_date_check(birth) == false
      raise StandardError.new "Неверный формат даты рождения"
    else
      s=birth.split(".").map{|i| i.size<2 ? "0"+i : i}.join(".")
      puts print "Дата рождения: ", s
    end
  end
  def passport_format(passport)
    if passport_check(passport) == false
      raise StandardError.new "Неверный формат паспортных данных"
    else
      s=passport.delete("-").delete(" ").chars.first(4).join
      n=passport.delete("-").delete(" ").chars.last(6).join
      puts print "Серия и номер паспорта: ", s, " ",n
    end
  end
  def output()
    name_setter()
    birth_date_setter()
    phone_setter()
    puts print "Адрес: ", address
    email_setter()
    passport_setter()
    puts print "Специальность: ", spec
    puts print "Название должности: ", job_name
    puts print "Стаж работы, прошлое место работы, зарплата на прошлом месте работы: ", exp,", ", last_job,", ",last_job_salary unless exp==0
  end
end

class TestEmployee<Employee
  def menu()
    puts "Выберите поле, которое хотите ввести: "
    line=gets.chomp
    case line
    when "FIO"
      name_setter()
    when "Date of birth"
      birth_date_setter()
    when "Phone"
      phone_setter()
    when "E-mail"
      email_setter()
    when "Passport"
      passport_setter()
    end
  end

end

emp1 = TestEmployee.new("Темный Кирилл Владиславович","2.11.2000","79608635782","Сормовская","kirik201100@mail.ru","0315 02 32 62","Программистер",5,"Макдак","Уборщик","5000")
emp2 = TestEmployee.new("Лупа - Пупа пупа - пупа ахмед соглы","11.10.2000","79608642149","Тюляева","beep_boop@gmail.com","03 20 02-37-59","Лингвист",0,"КФС","Кассир","7000")
emp1.output()
emp1.menu()
