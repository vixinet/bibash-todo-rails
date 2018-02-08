class CreateMilestones < ActiveRecord::Migration[5.1]
  def change
    create_table :milestones do |t|
      t.string :label
      t.datetime :deadline
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
