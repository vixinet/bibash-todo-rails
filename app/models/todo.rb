class Todo < ApplicationRecord
  validates :label, presence: true

  belongs_to :project

  enum priority: [:high, :normal, :low]

  def self.total
    Todo.all.size
  end
end
