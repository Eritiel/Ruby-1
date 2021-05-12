class Employee
  attr_reader :phone,:name,:birth,:passport,:address,:exp, :degree, :additional_payment, :play_name, :role, :contract_start, :contract_end
  def initialize(name, birth, phone, address, passport, play_name, role, contract_start, contract_end, exp, degree, additional_payment)
    self.name= name
    self.birth= birth
    self.phone= phone
    self.address= address
    self.passport= passport
    self.degree= degree
    self.additional_payment= additional_payment
    self.play_name= play_name
    self.role= role
    self.contract_start= contract_start
    self.contract_end= contract_end
    self.check_exp(exp,degree, additional_payment)
  end

  def check_exp(exp,degree, additional_payment)
      self.exp= exp
    unless exp=="0"
      self.degree= degree
      self.additional_payment= additional_payment
    end
  end

  def self.employee_without_experience (name, birth, phone, address, passport, play_name, role, contract_start, contract_end)
    Employee.new(name, birth, phone, address, passport, play_name, role, contract_start, contract_end, "0", nil, nil)
  end

  def phone=(new_phone)
    @phone=Employee.phone_format(new_phone)
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

  def degree=(new_degree)
    @degree=new_degree
  end

  def exp=(new_exp)
    @exp=new_exp
  end

  def additional_payment=(new_additional_payment)
    @additional_payment=new_additional_payment
  end

  def play_name=(new_play_name)
    @play_name=new_play_name
  end

  def role=(new_role)
    @role=new_role
  end

  def contract_start=(new_contract_start)
    @contract_start=Employee.date_format(new_contract_start)
  end

  def contract_end=(new_contract_end)
    @contract_end=Employee.date_format(new_contract_end)
  end

  def self.number_check(phone)
    phone=~/^(\+?[7]|[7]|[8])([-+()]*[0-9]{3}[-+()]*[0-9]{7}|[0-9]{10}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{4}|[-+()]*[0-9]{3}[-+()]*[-+()]*[0-9]{3}[-+()]*[0-9]{2}[-+()]*[0-9]{2})\b/
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
       "Имя актера: #{name()}; Дата рождения актера: #{birth()}; Телефон актера: #{phone()}; Адрес: #{address()}; Серия и номер пасспорта: #{passport().join(" ")}; Название пьесы: #{play_name()}; Роль: #{role()}; Начало действия контракта: #{contract_start()}; Конец действия контракта: #{contract_end()}; Стаж работы, профессиональные награды, надбавки: #{exp()}, #{degree()}, #{additional_payment()}"
     else "Имя сотрудника: #{name()}; Дата рождения сотрудника: #{birth()}; Телефон сотрудника: #{phone()}; Адрес: #{address()}; Серия и номер пасспорта: #{passport().join(" ")}; Название пьесы: #{play_name()}; Роль: #{role()}; Начало действия контракта: #{contract_start()}; Конец действия контракта: #{contract_end()}"
     end
   end

end


#t_v_l_e = TerminalViewListEmployee.new
#t_v_l_e.run

#emp1 = Employee.new("темный кирилл владиславович","2.11.2000","89608635782","Сормовская","03 15 02 32 62","Гамлет","Лаэрт","20.11.2020", "20.03.2021", "15","Золотой голос России","5000")
#emp2 = Employee.new("Лупа - Пупа  пупа - пупа ахмед соглы","11.10.55","79608642149","Тюляева","03 20 02-37-59","Вишневый сад","Фирс","11.10.2020", "11.05.2021", "0","none", "none")
#puts emp1.to_s
#puts emp2.to_s
