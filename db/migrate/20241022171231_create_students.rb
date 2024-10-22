class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :imie
      t.string :nazwisko
      t.string :indeks, limit: 6
      t.date :bdate
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
