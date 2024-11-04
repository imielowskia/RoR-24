class CreateFields < ActiveRecord::Migration[7.2]
  def change
    create_table :fields do |t|
      t.string :nazwa

      t.timestamps
    end
  end
end
