class AddStatusToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :status, :enum
  end
end
