require_relative "Employee"
class TestEmployee
  def menu()
    emp1 = Employee.new("темный кирилл владиславович","2.11.2000","89608635782","Сормовская","kirik201100@mail.ru","03 15 02 32 62","Программистер","5","Макдак","Уборщик","5000")
    emp2 = Employee.new("Лупа - Пупа  пупа - пупа ахмед соглы","11.10.2000","79608642149","Тюляева","beep_boop@gmail.com","03 20 02-37-59","Лингвист","0","КФС","Кассир","7000")

    emp1.output
    emp2.output
  end

end
empl1 = TestEmployee.new
empl1.menu
