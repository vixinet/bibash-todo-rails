class CreateLabelsProjects < ActiveRecord::Migration[5.1]
  def change
    drop_table :projects_labels
    create_table :labels_projects, id: false do |t|
      t.belongs_to :project, index: true  
      t.belongs_to :label, index: true
    end
  end
end
