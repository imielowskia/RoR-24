class AddGradeToCourseStudent < ActiveRecord::Migration[7.2]
  def change
    rename_table 'courses_students', 'grades'
    add_column :grades, :grade, :decimal, precision: 3, scale: 1
  end
end
