class Employee
  attr_reader :last_job,:last_job_salary,:phone,:mail,:surname,:first_name,:fath,:birth
  attr_accessor :address,:passport,:spec,:job_name,:exp
  def initialize (surname, first_name, fath, birth, phone, address, mail, passport, spec, exp, last_job, job_name, last_job_salary)
    @surname=surname
    @first_name=first_name
    @fath=fath
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
  def phone_setter(new_phone)
    @phone=new_phone if phone_format(new_phone)
  end
  def email_setter(new_mail)
    @mail=new_mail if email_format(new_mail)
  end
  def name_setter(new_surname, new_first_name, new_fath)
    if name_format(surname, first_name, fath)
      @surname=new_surname
      @first_name=new_first_name
      @fath=new_fath
    end
  end
  def birth_date_setter(new_birth)
    @birth=new_birth if date_format(new_birth)
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
  def name_check(surname, first_name, fath)
    if (surname=~/[\s]*[а-яА-Яa-zA-Z]+[\s]*[-]{0,1}[\s]*[a-zA-ZА-Яа-я]*[\s]*/&&first_name=~/[\s]*[а-яА-Яa-zA-Z]+[\s]*[-]{0,1}[\s]*[a-zA-ZА-Яа-я]*[\s]*/&&fath=~/[\s]*[а-яА-Яa-zA-Z]+[\s]*[a-zA-ZА-Яа-я]*[\s]*/)
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
  def name_format(surname, first_name, fath)
    if name_check(surname, first_name, fath) == false
      raise StandardError.new "Неверный формат имени"
    else
      s=surname.delete(" ").split("-").map{|i| i.capitalize}.join("-")
      f=first_name.delete(" ").split("-").map{|i| i.capitalize}.join("-")
      o=fath.capitalize
      puts print "Телефон сотрудника: ",s," ",f," ",o
    end
  end
  def date_format(birth)
    if birth_date_check(birth) == false
      raise StandardError.new "Неверный формат даты рождения"
    else
      s=birth.split(".").map{|i| i.size<2 ? "0"+i : i}.join(".")
      puts print "Дата рождения: ", s
    end
  end
  def output()
    name_setter(surname, first_name, fath)
    birth_date_setter(birth)
    phone_setter(phone)
    puts print "Адрес: ", address
    email_setter(mail)
    puts print "Серия и номер паспорта: ",passport
    puts print "Специальность: ", spec
    puts print "Название должности: ", job_name
    puts print "Стаж работы, прошлое место работы, зарплата на прошлом месте работы: ", exp,", ", last_job,", ",last_job_salary unless exp==0
  end
end

class TestEmployee<Employee
end

emp1 = TestEmployee.new("Темный","Кирилл" ,"Владиславович","2.11.2000","79608635782","Сормовская","kirik201100@mail.ru","03150232620","Программистер",5,"Макдак","Уборщик","5000")
emp2 = TestEmployee.new("Лупа","Пупа" ,"Ахмедович","11.10.2000","79608642149","Тюляева","beep_boop@gmail.com","03150237593","Лингвист",0,"КФС","Кассир","7000")
emp1.output()
emp2.output()
