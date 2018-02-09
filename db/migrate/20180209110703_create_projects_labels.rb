class CreateProjectsLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_labels, id: false do |t|
      t.belongs_to :project, index: true  
      t.belongs_to :label, index: true
    end
  end
end
