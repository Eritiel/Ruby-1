class Employee
  attr_reader :last_job_spec,:last_job_salary,:phone,:mail,:name,:birth,:passport,:address,:spec,:last_job_name,:exp
  def initialize(name, birth, phone, address, mail, passport, spec, exp, last_job_name, last_job_spec, last_job_salary)
    self.name= name
    self.birth= birth
    self.phone= phone
    self.address= address
    self.mail= mail
    self.passport= passport
    self.spec= spec
    self.check_exp(exp,last_job_name,last_job_spec,last_job_salary)
  end

  def check_exp(exp,last_job_name,last_job_spec,last_job_salary)
      self.exp= exp
    unless exp=="0"
      self.last_job_name= last_job_name
      self.last_job_spec= last_job_spec
      self.last_job_salary= last_job_salary
    end
  end

  def self.employee_without_experience (name, birth, phone, address, mail, passport, spec)
    Employee.new(name, birth, phone, address, mail, passport, spec, 0, nil, nil, nil)
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

  def last_job_name=(new_last_job_name)
    @last_job_name=new_last_job_name
  end

  def last_job_spec=(new_last_job_spec)
    @last_job_spec=new_last_job_spec
  end
  
  def last_job_salary=(new_last_job_salary)
    @last_job_salary=new_last_job_salary
  end

  def self.number_check(phone)
    phone=~/^(\+?[7]|[7]|[8])([-+()]*[0-9]{3}[-+()]*[0-9]{7}|[0-9]{10}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{4}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{2}[-+()]*[0-9]{2})\b/
  end

  def self.email_check(mail)
    mail=~/^[\w\d]+@[\w\d]+\.[\w]+/
  end

  def self.name_check(name)
    name=~/^(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*-[\s]*[a-zА-Яа-яA-Z]+)[\s]+(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*-[\s]*[a-zА-Яа-яA-Z]+)[\s]*(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*[a-zА-Яа-яA-Z]+[\s]*)$/
  end

  def self.birth_date_check(birth)
    birth=~/^(?:0?[1-9]|[12]\d|3[01]).(?:0[1-9]|1[012]).(?:(19|20\d\d$)|(\d{2}$))/
  end

  def self.passport_check(passport)
    passport=~/^(?:\d{4}|\d{2}[\s-]\d{2})\s?(?:\d{6}$|\d{2}[\s-]\d{2}[\s-]\d{2}$)/
  end

  def self.phone_format(phone)
    if number_check(phone)
      s = phone.scan(/[0-9]/)
      return [s[0],s[1,3].join(),s[4,10].join()].join("-")
    else
      raise ArgumentValueError.new("Неверный формат телефона")
    end
  end

  def self.email_format(mail)
    if email_check(mail)
      s = mail.chars.map{|i| i.downcase}.join
      return s
    else
      raise ArgumentValueError.new("Неверный формат электронной почты")
    end
  end

  def self.name_format(name)
    if name_check(name)
      s = name.downcase
      s = name.gsub(/\s\s+/, " ").gsub(/\b./, &:upcase).gsub(/(?<=[а-яa-zA-ZА-Я])\s-\s(?=[а-яa-zA-ZА-Я])/, "-")
      return s
    else
      raise ArgumentValueError.new("Неверный формат имени")
      end
  end

  def self.date_format(birth)
    if birth_date_check(birth)
      s=birth.split(".").map{|i| i.size<2 ? "0"+i : i}.join(".")
      return s
    else
      raise ArgumentValueError.new("Неверный формат даты рождения")
    end
  end

  def self.passport_format(passport)
    if passport_check(passport)
      s=passport.delete("-").delete(" ").chars.first(4).join
      n=passport.delete("-").delete(" ").chars.last(6).join
      return s,n
    else
      raise "Неверный формат паспортных данных"
    end
  end

  class ArgumentValueError < StandardError
    def initialize(msg = "ArgumentValueError")
      super msg
    end
  end

  def to_s
    if @exp != "0"
       "Имя сотрудника: #{name()}; Дата рождения сотрудника: #{birth()}; Телефон сотрудника: #{phone()}; Адрес: #{address()}; E-mail: #{mail()}; Серия и номер пасспорта: #{passport().join(" ")}; Специальность: #{spec()}; Стаж работы, прошлое место работы, должность, зарплата на прошлом месте работы: #{exp()}, #{last_job_name()}, #{last_job_spec()}, #{last_job_salary()}"
     else "Имя сотрудника: #{name()}; Дата рождения сотрудника: #{birth()}; Телефон сотрудника: #{phone()}; Адрес: #{address()}; E-mail: #{mail()}; Серия и номер пасспорта: #{passport().join(" ")}; Специальность: #{spec()}"
     end
   end

end


#t_v_l_e = TerminalViewListEmployee.new
#t_v_l_e.run

#emp1 = Employee.new("темный кирилл владиславович","2.11.2000","89608635782","Сормовская","kirik201100@mail.ru","03 15 02 32 62","Программистер","5","Макдак","Уборщик","5000")
#emp2 = Employee.new("Лупа - Пупа  пупа - пупа ахмед соглы","11.10.2000","79608642149","Тюляева","beep_boop@gmail.com","03 20 02-37-59","Лингвист","0","КФС","Кассир","7000")
#puts emp1.to_s
#puts emp2.to_s
