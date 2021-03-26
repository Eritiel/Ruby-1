class Employee
  attr_reader :last_job,:last_job_salary
  attr_accessor :surname,:first_name,:fath,:birth,:phone,:address,:mail,:passport,:spec,:job_name,:exp
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
  def output()
    puts print "ФИО работника: ", surname, " ",first_name," ",fath
    puts print "Год рождения работника: ", birth
    puts print "Телефон: ", phone
    puts print "Адрес: ", address
    puts print "E-mail: ",mail
    puts print "Серия и номер паспорта: ",passport
    puts print "Специальность: ", spec
    puts print "Название должности: ", job_name
    puts print "Стаж работы, прошлое место работы, зарплата на прошлом месте работы: ", exp,", ", last_job,", ",last_job_salary unless exp==0
  end
end

class TestEmployee<Employee
  attr_reader :last_job,:last_job_salary
  attr_accessor :surname,:first_name,:fath,:birth,:phone,:address,:mail,:passport,:spec,:job_name,:exp
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
end

emp1 = TestEmployee.new("Темный","Кирилл" ,"Владиславович",2000,"79608635782","Сормовская","kirik@mail.ru","03150232620","Программистер",5,"Макдак","Уборщик","5000")
emp2 = TestEmployee.new("Лупа","Пупа" ,"Ахмедович",2000,"79608643219","Тюляева","beep_boop@gmail.com","03150237593","Лингвист",0,"КФС","Кассир","7000")
emp1.output()
emp2.output()
