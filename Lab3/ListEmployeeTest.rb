require 'test/unit'
require_relative 'ListEmployee'
require_relative 'Employee'

class ListEmployeeTest < Test::Unit::TestCase

  def setup
  	@list = ListEmployee.new()
    @emp = Employee.new("0", "темный кирилл владиславович","20.11.00","89608635782","Сормовская","kirik201100@mail.ru","03 15 02 32 62","Программист","5", "П", "П", "50000")
  end

  def add_test
    assert(@list.add(@emp), 'It fails')
  end

  def read_db_test
    assert(@list.read_db(), 'It fails')
  end

  def add_to_db_test
    assert(@list.add_to_db("темный кирилл владиславович","20.11.00","89608635782","Сормовская","kirik201100@mail.ru","03 15 02 32 62","Программист","5", "П", "П", "50000"), 'It fails')
  end

  def delete_from_db_test
    assert(@list.delete_from_db(@emp), 'It fails')
  end

  def delete_from_db_test
    assert(@list.delete_from_db(@emp), 'It fails')
  end

  def search_test
    assert_equal @emp, @list.search('89608635782')
  end

  





end
