class AddRatingToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :rating, :float
  end
end
