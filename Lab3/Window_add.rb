require 'fox16'
require_relative 'Employee'
require_relative 'Controller'
include Fox

class Window_add < FXMainWindow
  def initialize(app, controller, table)
    @app = app
    @table = table
    @controller = controller
    super(app, "Staff" , :width => 500, :height => 500)
    head = FXLabel.new(self, "Добавление сотрудника",
                       :opts => JUSTIFY_CENTER_X, :padding => 15)
    head.justify = JUSTIFY_CENTER_X
    head.font =  FXFont.new(app, "Geneva" , 15)

    @main_frame = FXHorizontalFrame.new(self, :padding => 20)
    @frame_names = FXVerticalFrame.new(@main_frame)
    @frame_input = FXVerticalFrame.new(@main_frame)


    FXLabel.new(@frame_names, "ID:", :padding => 4)
    @id = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "ФИО:", :padding => 4)
    @name_emp = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Дата рождения:", :padding => 4)
    @birthday = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Номер телефона:", :padding => 4)
    @phone_number = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Адрес:", :padding => 4)
    @address = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "E-mail:", :padding => 4)
    @e_mail = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Паспорт:", :padding => 4)
    @passport = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Специальность:", :padding => 4)
    @speciality = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Опыт работы:", :padding => 4)
    @work_experience = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Предыдущее место работы:", :padding => 4)
    @last_workplace = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Должность на предыдущем месте работы:", :padding => 4)
    @last_post = FXTextField.new(@frame_input, 30)
    FXLabel.new(@frame_names, "Зарплата на предыдущем месте работы:", :padding => 4)
    @last_salary = FXTextField.new(@frame_input, 30)


    @name_emp.connect(SEL_COMMAND) do
      unless Employee.name_check(@name_emp.text)
        FXMessageBox.warning(
          self,
          MBOX_OK,
          "Ошибка",
          'Неправильный формат ФИО'
        )
      end
    end

    @birthday.connect(SEL_COMMAND) do
      unless Employee.birth_date_check(@birthday.text)
        FXMessageBox.warning(
          self,
          MBOX_OK,
          "Ошибка",
          'Неправильный формат даты рождения'
        )
      end
    end

    @phone_number.connect(SEL_COMMAND) do
      unless Employee.number_check(@phone_number.text)
        FXMessageBox.warning(
          self,
          MBOX_OK,
          "Ошибка",
          'Неправильный формат номера телефона'
        )
      end
    end

    @e_mail.connect(SEL_COMMAND) do
      unless Employee.email_check(@e_mail.text)
        FXMessageBox.warning(
          self,
          MBOX_OK,
          "Ошибка",
          'Неправильный формат E-mail '
        )
      end
    end

    @passport.connect(SEL_COMMAND) do
      unless Employee.passport_check(@passport.text)
        FXMessageBox.warning(
          self,
          MBOX_OK,
          "Ошибка",
          'Неправильный формат паспортных данных'
        )
      end
    end

    @button_save = FXButton.new(@frame_input,
                                "Добавить",
                                :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,
                                :width => 150, :height => 30, :padding => 50)

    @button_save.connect(SEL_COMMAND) do
      unless Employee.name_check(@name_emp.text) && Employee.email_check(@e_mail.text) &&
        Employee.birth_date_check(@birthday.text) && Employee.number_check(@phone_number.text) &&
        Employee.passport_check(@passport.text)
        FXMessageBox.warning(
          self,
          MBOX_OK,
          "Ошибка",
          'Неправильный формат введенных данных'
        )
      else
        add
      end
    end

  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  def add
    if @work_experience.text != '0'
      @controller.add(@id.text, @name_emp.text, @birthday.text, @phone_number.text, @address.text,
                          @e_mail.text, @passport.text, @speciality.text, @work_experience.text,
                          @last_workplace.text, @last_post.text, @last_salary.text)
    else
      @controller.add(@id.text, @name_emp.text, @birthday.text, @phone_number.text, @address.text,
                          @e_mail.text, @passport.text, @speciality.text, @work_experience.text, @last_workplace.text = nil, @last_post.text = nil, @last_salary.text = nil)
    end
    @table.setItemText(@table.numRows - 1, 0, @id.text)
    @table.setItemText(@table.numRows - 1, 1, @name_emp.text)
    @table.setItemText(@table.numRows - 1, 2, @birthday.text)
    @table.setItemText(@table.numRows - 1, 3, @phone_number.text)
    @table.setItemText(@table.numRows - 1, 4, @address.text)
    @table.setItemText(@table.numRows - 1, 5, @e_mail.text)
    @table.setItemText(@table.numRows - 1, 6, @passport.text)
    @table.setItemText(@table.numRows - 1, 7, @speciality.text)
    @table.setItemText(@table.numRows - 1, 8, @work_experience.text)
    @table.setItemText(@table.numRows - 1, 9, @last_workplace.text)
    @table.setItemText(@table.numRows - 1, 10, @last_post.text)
    @table.setItemText(@table.numRows - 1, 11, @last_salary.text)
    @table.visibleRows += 1
    self.close
  end
end

