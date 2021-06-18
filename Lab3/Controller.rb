require_relative 'ListEmployee'

class Controller

  def initialize
    @list = ListEmployee.new
    @list.read_DB
  end

  def show_list
    @list
  end

  def get_element(ind)
    @list.get_element(ind)
  end

def each_list(&block)
  @list.each_list(&block)
end

def list_size
  @list.list_length
end

  def add(id, fio, datebirth, phone, address, email, passport,
          speciality, experience, last_job_name, last_job_spec,
          last_job_salary)
    if experience !='0'
      emp = WorkDB.get_instance.add_employee(id, fio, datebirth, phone, address, email, passport,
                   speciality, experience,  last_job_name, last_job_spec ,
                   last_job_salary)
    else
      emp = WorkDB.get_instance.add_employee(id, fio, datebirth, phone, address, email, passport,
                                     speciality, experience, last_job_name = nil, last_job_spec = nil,
                                     last_job_salary = nil)
    end
    @list.add(emp)
  end

  def delete(employee)
    @list.delete_from_DB(employee)

  end
end
a = Controller.new()
puts a.show_list.to_s

