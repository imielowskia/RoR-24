class CreateDetailGrades < ActiveRecord::Migration[7.2]
  def change
    create_table :detail_grades do |t|
      t.references :course, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.decimal :grade, precision: 3, scale: 1
      t.date :data

      t.timestamps
    end
  end
end
