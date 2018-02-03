class Todo < ApplicationRecord
  validates :label, presence: true

  enum priority: [:high, :normal, :low]

  def self.total
    Todo.all.size
  end

  belongs_to :project
end
