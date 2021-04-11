class Employee
  attr_reader :last_job,:last_job_salary,:phone,:mail,:name,:birth,:passport,:address,:spec,:job_name,:exp
  def initialize (name, birth, phone, address, mail, passport, spec, exp, last_job, job_name, last_job_salary)
    self.name=name
    self.birth=birth
    self.phone=phone
    self.address=address
    self.mail=mail
    self.passport=passport
    self.spec=spec
    self.job_name=job_name
    self.check_exp(exp,last_job,last_job_salary)
  end
  def check_exp(new_exp,new_last_job,new_last_job_salary)
    self.exp=new_exp
    unless new_exp=="0"
      self.last_job=new_last_job
      self.last_job_salary=new_last_job_salary
    end
  end
  def phone=(new_phone)
    @phone=Employee.phone_format(new_phone)
  end
  def mail=(new_mail)
    @mail=Employee.email_format(new_mail)
  end
  def name=(new_name)
    @name=Employee.name_format(new_name)
  end
  def birth=(new_birth)
    @birth=Employee.date_format(new_birth)
  end
  def passport=(new_passport)
    @passport=Employee.passport_format(new_passport)
  end
  def address=(new_address)
    @address=new_address
  end
  def spec=(new_spec)
    @spec=new_spec
  end
  def exp=(new_exp)
    @exp=new_exp
  end
  def job_name=(new_job_name)
    @job_name=new_job_name
  end
  def last_job=(new_last_job)
    @last_job=new_last_job
  end
  def last_job_salary=(new_last_job_salary)
    @last_job_salary=new_last_job_salary
  end

  def self.number_check(phone)
    if phone=~/^(\+?[7]|[7]|[8])([-+()]*[0-9]{3}[-+()]*[0-9]{7}|[0-9]{10}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{4}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{2}[-+()]*[0-9]{2})\b/
      return true
    else
      return false
    end
  end
  def self.email_check(mail)
    if mail=~/^[\w\d]+@[\w\d]+\.[\w]+/
      return true
    else
      return false
    end
  end
  def self.name_check(name)
    if name=~/^(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*-[\s]*[a-zА-Яа-яA-Z]+)[\s]+(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*-[\s]*[a-zА-Яа-яA-Z]+)[\s]*(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*[a-zА-Яа-яA-Z]+[\s]*)$/
      return true
    else
      return false
    end
  end
  def self.birth_date_check(birth)
    if birth=~/^(?:0?[1-9]|[12]\d|3[01]).(?:0[1-9]|1[012]).(?:(19|20\d\d$)|(\d{2}$))/
      return true
    else
      return false
    end
  end
  def self.passport_check(passport)
    if passport=~/^(?:\d{4}|\d{2}[\s-]\d{2})\s?(?:\d{6}$|\d{2}[\s-]\d{2}[\s-]\d{2}$)/
      return true
    else
      return false
    end
  end
  def self.phone_format(phone)
    if number_check(phone) == false
      raise StandardError.new "Неверный формат телефона"
    else
      s=phone.scan(/[0-9]/)
      return [s[0],s[1,3].join(),s[4,10].join()].join("-")
    end
  end
  def self.email_format(mail)
    if email_check(mail) == false
      raise StandardError.new "Неверный формат электронной почты"
    else
      s=mail.chars.map{|i| i.downcase}.join
      return s
    end
  end
  def self.name_format(name)
    if name_check(name) == false
      raise StandardError.new "Неверный формат имени"
    else
      s = name.downcase
      s = name.gsub(/\s\s+/, " ").gsub(/\b./, &:upcase).gsub(/(?<=[а-яa-zA-ZА-Я])\s-\s(?=[а-яa-zA-ZА-Я])/, "-")
      end
      return s
  end
  def self.date_format(birth)
    if birth_date_check(birth) == false
      raise StandardError.new "Неверный формат даты рождения"
    else
      s=birth.split(".").map{|i| i.size<2 ? "0"+i : i}.join(".")
      return s
    end
  end
  def self.passport_format(passport)
    if passport_check(passport) == false
      raise StandardError.new "Неверный формат паспортных данных"
    else
      s=passport.delete("-").delete(" ").chars.first(4).join
      n=passport.delete("-").delete(" ").chars.last(6).join
      return s,n
    end
  end

  def output()
    puts print "ФИО сотрудника: ",name()
    puts print "Дата рождения сотрудника: ",birth()
    puts print "Телефон сотрудника: ",phone()
    puts print "Адрес: ", address
    puts print "E-mail: ",mail()
    puts print "Серия и номер пасспорта: ", passport().join(" ")
    puts print "Специальность: ", spec
    puts print "Название должности: ", job_name
    puts print "Стаж работы, прошлое место работы, зарплата на прошлом месте работы: ", exp,", ", last_job,", ",last_job_salary unless exp=="0"
  end
end


#t_v_l_e = TerminalViewListEmployee.new
#t_v_l_e.run

#emp1 = TestEmployee.new("темный кирилл владиславович","2.11.2000","89608635782","Сормовская","kirik201100@mail.ru","03 15 02 32 62","Программистер",5,"Макдак","Уборщик","5000")
#emp2 = TestEmployee.new("Лупа - Пупа  пупа - пупа ахмед соглы","11.10.2000","79608642149","Тюляева","beep_boop@gmail.com","03 20 02-37-59","Лингвист",0,"КФС","Кассир","7000")
#emp1.output()
#emp2.output()
