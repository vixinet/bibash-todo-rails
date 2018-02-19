class RemoveDescriptionFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :description
  end
end
