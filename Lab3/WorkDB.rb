require_relative 'Employee'
require 'mysql2'


class WorkDB
   @@instance = nil
   def initialize
     @connection = Mysql2::Client.new(
       :host => 'localhost',
       :username => 'user',
       :password => 'test',
       :database => 'Staff')

   end

   def self.get_instance
     if @@instance == nil
       @@instance = WorkDB.new
     end
     @@instance
   end

 def read_list
     results = @connection.query("SELECT * FROM employees")
     list_emp = []
     results.each do |row|
       if row['experience']!='0'
         emp = Employee.new(row['employee_id'], row['name'], row['birth_date'], row['phone'], row['address'],
                            row['email'], row['passport'], row['speciality'], row['experience'],
                            row['last_job_name'], row['last_job_spec'], row['last_job_salary'])
       else
         emp = Employee.new(row['employee_id'], row['name'], data, row['phone'], row['address'],
                            row['email'], row['passport'], row['speciality'], row['experience'])
       end
       list_emp << emp
     end
     list_emp
   end

   def add_employee(emp)
       if emp.exp !='0'
         @connection.query("INSERT INTO `Staff`.`employees` (`name` ,`birth_date` ,`phone` ,`address` ,`email` ,
                                 `passport` ,`speciality` ,`experience`, `last_job_name` ,`last_job_spec` ,`last_job_salary`)
                               VALUES ('#{emp.name}', '#{emp.birth}', '#{emp.phone}', '#{emp.address}', '#{emp.mail}',
                                 '#{emp.passport}', '#{emp.spec}', #{emp.exp},
                                 '#{emp.last_job_name}', '#{emp.last_job_spec}', '#{emp.last_job_salary}')")
         else
           @connection.query("INSERT INTO `Staff`.`employees` (`name` ,`birth_date` ,`phone` ,`address` ,`email` ,
                                   `passport` ,`speciality` ,`experience`)
                                 VALUES ('#{emp.name}', '#{emp.birth}', '#{emp.phone}', '#{emp.address}', '#{emp.mail}',
                                   '#{emp.passport}', '#{emp.spec}', #{emp.exp})")
       end
     end

  def delete_emp(emp)
    @connection.query("DELETE FROM employees WHERE name = '#{emp.name}'")
  end

  def change_emp(emp)
    query_str = "UPDATE employees
                           SET name = '#{emp.name}',
                               birth_date = '#{emp.birth}',
                               phone = '#{emp.phone}',
                               address = '#{emp.address}',
                               email = '#{emp.mail}',
                               passport =' #{emp.passport}',
                               speciality = '#{emp.spec}',
                               experience = #{emp.exp},
                                last_job_name = '#{emp.last_job_name}',
                                last_job_spec = '#{emp.last_job_spec}',
                                last_job_salary = '#{emp.last_job_salary}'
                           WHERE name = #{emp.name}"
    @connection.query(query_str)
  end
end
