#Класс для хранения информации о сотруднике и проверки корректности введенных данных
class Employee
  attr_reader :id, :last_job_spec,:last_job_salary,:phone,:mail,:name,:birth,:passport,:address,:spec,:last_job_name,:exp

  #Создает новый экземпляр со строковыми атрибутами
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
  def initialize(id, name, birth, phone, address, mail, passport, spec, exp, last_job_name, last_job_spec, last_job_salary)
    @id = id
    self.name= name
    self.birth= birth
    self.phone= phone
    self.address= address
    self.mail= mail
    self.passport= passport
    self.spec= spec
    self.check_exp(exp,last_job_name,last_job_spec,last_job_salary)
  end

  #Определяет, необходимо ли инициализировать поля +last_job_name+, +last_job_spec+, +last_job_salary+
  #Если поле +exp == '0'+, то данные поля не инициализируются.
  def check_exp(exp,last_job_name,last_job_spec,last_job_salary)
      self.exp= exp
    unless exp=="0"
      self.last_job_name= last_job_name
      self.last_job_spec= last_job_spec
      self.last_job_salary= last_job_salary
    end
  end

  #Инициализирует новый экземпляр для сотрудника без опыта работы.
  def self.employee_without_experience (id, name, birth, phone, address, mail, passport, spec)
    Employee.new(id, name, birth, phone, address, mail, passport, spec, "0", nil, nil, nil)
  end

  #Устанавливает значение +phone+.
  def phone=(new_phone)
    @phone=Employee.phone_format(new_phone)
  end

  #Устанавливает значение +mail+.
  def mail=(new_mail)
    @mail=Employee.email_format(new_mail)
  end

  #Устанавливает значение +name+.
  def name=(new_name)
    @name=Employee.name_format(new_name)
  end

  #Устанавливает значение +birth+.
  def birth=(new_birth)
    @birth=Employee.date_format(new_birth)
  end

  #Устанавливает значение +passport+.
  def passport=(new_passport)
    @passport=Employee.passport_format(new_passport)
  end

  #Устанавливает значение +address+.
  def address=(new_address)
    @address=new_address
  end

  #Устанавливает значение +spec+.
  def spec=(new_spec)
    @spec=new_spec
  end

  #Устанавливает значение +exp+.
  def exp=(new_exp)
    @exp=new_exp
  end

  #Устанавливает значение +last_job_name+.
  def last_job_name=(new_last_job_name)
    @last_job_name=new_last_job_name
  end

  #Устанавливает значение +last_job_spec+.
  def last_job_spec=(new_last_job_spec)
    @last_job_spec=new_last_job_spec
  end

  #Устанавливает значение +last_job_salary+.
  def last_job_salary=(new_last_job_salary)
    @last_job_salary=new_last_job_salary
  end

  #Определяет, является ли введенная строка номером телефона. Возвращает +0+,если строка является номером телефона.
  # === Аргументы
  # * _phone_ - строка для проверки
  def self.number_check(phone)
    phone=~/^(\+?[7]|[7]|[8])([-+()]*[0-9]{3}[-+()]*[0-9]{7}|[0-9]{10}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{4}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{2}[-+()]*[0-9]{2})\b/
  end

  #Определяет, является ли введенная строка адресом электронной почты. Возвращает +0+,если строка является адресом электронной почты.
  # === Аргументы
  # * _mail_ - строка для проверки
  def self.email_check(mail)
    mail=~/^[\w\d]+@[\w\d]+\.[\w]+/
  end

  #Определяет, является ли введенная строка ФИО. Возвращает +0+, если строка является ФИО.
  # === Аргументы
  # * _name_ - строка для проверки
  def self.name_check(name)
    name=~/^(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*-[\s]*[a-zА-Яа-яA-Z]+)[\s]+(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*-[\s]*[a-zА-Яа-яA-Z]+)[\s]*(?:[а-яА-ЯA-Za-z]+|[а-яА-ЯA-Za-z]+[\s]*[a-zА-Яа-яA-Z]+[\s]*)$/
  end

  #Определяет, является ли введенная строка датой. Возвращает +0+,если строка является датой.
  # === Аргументы
  # * _birth_ - строка для проверки
  def self.birth_date_check(birth)
    birth=~/^(?:0?[1-9]|[12]\d|3[01]).(?:0[1-9]|1[012]).(?:(19|20\d\d$)|(\d{2}$))/
  end

  #Определяет, является ли введенная строка паспортными данными. Возвращает +0+,если строка является паспортными данными.
  # === Аргументы
  # * _passport_ - строка для проверки
  def self.passport_check(passport)
    passport=~/^(?:\d{4}|\d{2}[\s-]\d{2})\s?(?:\d{6}$|\d{2}[\s-]\d{2}[\s-]\d{2}$)/
  end

  #Если введенная строка является номером телефона, возвращает ее в формате 7-XXX-XXXXXXX. В противном случае вызывает исключение ArgumentValueError.
  # === Аргументы
  # * _phone_ - строка для форматирования
  def self.phone_format(phone)
    if number_check(phone)
      s = phone.scan(/[0-9]/)
      return [s[0],s[1,3].join(),s[4,10].join()].join("-")
    else
      raise ArgumentValueError.new("Неверный формат телефона")
    end
  end

  #Если введенная строка является адресом электронной почты, возвращает ее в формате example@gmail.com. В противном случае вызывает исключение ArgumentValueError.
  # === Аргументы
  # * _mail_ - строка для форматирования
  def self.email_format(mail)
    if email_check(mail)
      s = mail.chars.map{|i| i.downcase}.join
      return s
    else
      raise ArgumentValueError.new("Неверный формат электронной почты")
    end
  end

  #Если введенная строка является ФИО, возвращает ее в формате Фамилия Имя Отчество. В противном случае вызывает исключение ArgumentValueError.
  # === Аргументы
  # * _name_ - строка для форматирования
  def self.name_format(name)
    if name_check(name)
      s = name.downcase
      s = name.gsub(/\s\s+/, " ").gsub(/\b./, &:upcase).gsub(/(?<=[а-яa-zA-ZА-Я])\s-\s(?=[а-яa-zA-ZА-Я])/, "-")
      return s
    else
      raise ArgumentValueError.new("Неверный формат имени")
      end
  end

  #Если введенная строка является датой, возвращает ее в формате DD.MM.YYYY. В противном случае вызывает исключение ArgumentValueError.
  # === Аргументы
  # * _birth_ - строка для форматирования
  def self.date_format(birth)
    if birth_date_check(birth)
      s=birth.split(".").map{|i| i.size<2 ? "0"+i : i}.join(".")
      return s
    else
      raise ArgumentValueError.new("Неверный формат даты рождения")
    end
  end

  #Если введенная строка является паспортными данными, возвращает ее в формате XXXX XXXXX. В противном случае вызывает исключение ArgumentValueError.
  # === Аргументы
  # * _passport_ - строка для форматирования
  def self.passport_format(passport)
    if passport_check(passport)
      s=passport.delete("-").delete(" ").chars.first(4).join
      n=passport.delete("-").delete(" ").chars.last(6).join
      return s,n
    else
      raise "Неверный формат паспортных данных"
    end
  end

  #Осуществляет представление объекта класса +Employee+ в виде форматированной строки.
  def to_s
    if @exp != "0"
       "ID сотрудника: #{id}; Имя сотрудника: #{name()}; Дата рождения сотрудника: #{birth()}; Телефон сотрудника: #{phone()}; Адрес: #{address()}; E-mail: #{mail()}; Серия и номер пасспорта: #{passport().join(" ")}; Специальность: #{spec()}; Стаж работы, прошлое место работы, должность, зарплата на прошлом месте работы: #{exp()}, #{last_job_name()}, #{last_job_spec()}, #{last_job_salary()}"
     else "ID сотрудника: #{id}; Имя сотрудника: #{name()}; Дата рождения сотрудника: #{birth()}; Телефон сотрудника: #{phone()}; Адрес: #{address()}; E-mail: #{mail()}; Серия и номер пасспорта: #{passport().join(" ")}; Специальность: #{spec()}"
     end
   end

   def get_data
     [id, name, birth, phone, address, mail, passport.join(" "), spec, exp, last_job_name, last_job_spec, last_job_salary]
   end
 end


#Инициализирует исключение типа ArgumentValueError.
class ArgumentValueError < StandardError
  #Создает новый экземпляр со значением ArgumentValueError.
  # * _msg_ - тип вызываемого исключения
  def initialize(msg = "ArgumentValueError")
    super msg
  end
end

#t_v_l_e = TerminalViewListEmployee.new
#t_v_l_e.run

#emp1 = Employee.new("0", "темный кирилл владиславович","2.11.00","89608635782","Сормовская","kirik201100@mail.ru","03 15 02 32 62","Программистер","5","Макдак","Уборщик","5000")
#emp2 = Employee.new("1", "Лупа - Пупа  пупа - пупа ахмед соглы","11.10.2000","79608642149","Тюляева","beep_boop@gmail.com","03 20 02-37-59","Лингвист","0","КФС","Кассир","7000")
#puts emp1.to_s
#puts emp2.to_s
