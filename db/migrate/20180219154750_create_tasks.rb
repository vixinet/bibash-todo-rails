class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.boolean :done
      t.string :label
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
