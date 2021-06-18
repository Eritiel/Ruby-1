require 'test/unit'
require_relative 'Employee'

class EmployeeTest < Test::Unit::TestCase

  def setup
  	@emp = Employee.new("0", "темный кирилл владиславович","20.11.00","89608635782","Сормовская","kirik201100@mail.ru","03 15 02 32 62","Программист","5", "П", "П", "50000")
  end

  def test_phone_validate
    assert_equal 0, Employee.number_check("79608635782")
  end

  def test_name_validate
    assert_equal 0, Employee.name_check("Тем Кир Влад")
  end

  def test_email_validate
    assert_equal 0, Employee.email_check("example@mail.ru")
  end

  def test_date_validate
    assert_equal 0, Employee.birth_date_check("20.11.00")
  end

  def test_passport_validate
    assert_equal 0, Employee.passport_check("0320 456789")
  end

  def test_date_format
    assert_equal "02.11.2000", Employee.date_format("2.11.2000")
  end

  def test_phone_format
    assert_equal "7-960-8635782", Employee.phone_format("79608635782")
  end

  def test_name_format
    assert_equal "Тем Кир Влад", Employee.name_format("тем кир влад")
  end

  def test_email_format
    assert_equal "example@mail.ru", Employee.email_format("EXAMPLE@MAIL.RU")
  end

  def test_passport_format
    assert_equal ["0320", "456789"], Employee.passport_format("0320 456789")
  end

  def test_to_s
    assert_equal "Тем Кир Влад", @emp.to_s
  end


end
