require 'fox16'
include Fox
require_relative 'Employee'
require_relative 'ListEmployee'
require_relative 'Controller'
require_relative 'Window_add'

class ListEmployeeWindow < FXMainWindow
  def initialize(app, controller)
    @app = app
    @controller = controller
    super(app, "Info", :width => 1200, :height => 500)
    head = FXLabel.new(self, 'Информация о сотрудниках ', :opts => JUSTIFY_CENTER_X, :padding => 15)
    @main_frame = FXHorizontalFrame.new(self)
    @frame1 = FXVerticalFrame.new(@main_frame, :opts => LAYOUT_FIX_WIDTH, :width => 900)
    @frame2 = FXVerticalFrame.new(@main_frame, :padding => 60)
    @button_delete = FXButton.new(@frame2,
                                  "Удалить сотрудника",
                                  :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,
                                  :width => 150, :height => 30)
    @button_delete.connect(SEL_COMMAND) { delete }
    @button_add = FXButton.new(@frame2,
                                    "Добавить сотрудника",
                                    :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,
                                    :width => 150, :height => 30)
    @button_add.connect(SEL_COMMAND) do
      app_add = FXApp.instance
      app_add.create
      window_add = Window_add.new(app_add, @controller, @table)
      window_add.create
      app_add.run
      app_add.stop
    end
    emp_table_head = FXLabel.new(@frame1, 'Список сотрудников', :opts => JUSTIFY_CENTER_X, :padding => 10)
    emp_table_head.font = FXFont.new(app, "Gothic", 12)
    head.font = FXFont.new(app, "Gothic", 14)
    @table = FXTable.new(@frame1, :padding => 15, :opts => LAYOUT_FIX_WIDTH, :width => 900)
    show_emp()
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  def delete
    target = @controller.get_element(@table.anchorRow)
    puts target
    @controller.delete(target)
    @table.removeRows(@table.anchorRow)
  end

  def show_emp
    names_columns = ['Номер', 'Имя', 'Дата рождения', 'Номер телефона', 'Адрес', 'E-mail', 'Паспорт',
                     'Специальность', 'Опыт работы', 'Прошлое место работы', 'Прошлая должность', 'Прошлая зарплата']
    @table.setTableSize(1, 12)

    @table.rowHeaderMode = LAYOUT_FIX_WIDTH
    @table.rowHeaderWidth = 5

    @table.visibleRows = 10
    @table.visibleColumns = 10

    names_columns.each_with_index do |name, ind|
      @table.setColumnText(ind, name)
      @table.setColumnWidth(ind, 200)
    end

      
    @controller.each_list do |emp|
      count = 0
        emp.get_data.each do |field|
          @table.setItemText(@table.numRows - 1, count , field.to_s )
          count+=1
            end
              @table.appendRows(1)
              p @table.numRows
        end
end
end

app = FXApp.new("Employee")
controller = Controller.new()
ListEmployeeWindow.new(app, controller)
app.create
app.run
