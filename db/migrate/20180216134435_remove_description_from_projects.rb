class RemoveDescriptionFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :description, :text
  end
end
