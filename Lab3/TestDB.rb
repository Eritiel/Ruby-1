require 'mysql2'
require_relative 'Employee'
require_relative 'ListEmployee'

client = Mysql2::Client.new(
  :host => 'localhost',
  :username => 'user',
  :password => 'test',
  :database => 'Staff')
refresh_table = client.query('DROP TABLE IF EXISTS employees;')
create_table = client.query('CREATE TABLE employees (employee_id INT PRIMARY KEY, name VARCHAR(50) NOT NULL, birth_date VARCHAR(10) NOT NULL, phone VARCHAR(50) NOT NULL, address VARCHAR(50) NOT NULL, email VARCHAR(50) NOT NULL, passport VARCHAR(50) NOT NULL, speciality VARCHAR(50) NOT NULL, experience INT NOT NULL, last_job_name VARCHAR(50) NULL, last_job_spec VARCHAR(50) NULL, last_job_salary INT NULL );')
client.query("INSERT INTO employees VALUES(0, 'Тем Кир Влад', '20.11.00', 79608635782, 'С', 'k@m.r', '0320 456789', 'Программист', '0', NULL, NULL, NULL )")
def test_select(client)
  select_from_table  = client.query("SELECT * FROM employees")
  new_list = ListEmployee.new
  select_from_table.each{|row|
    unless row["experience"] == 0
        new_list.add Employee.new row["name"], row["birth_date"], row["phone"], row["address"], row["email"], row["passport"], row["speciality"], row["experience"], row["last_job_name"], row["last_job_spec"], row["last_job_salary"]
    else
        new_list.add Employee.employee_without_experience row["name"], row["birth_date"], row["phone"], row["address"], row["email"], row["passport"], row["speciality"]
    end
  }
  new_list
end
puts test_select(client).to_s
