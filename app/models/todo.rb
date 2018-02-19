class Todo < ApplicationRecord
  validates :label, presence: true

  belongs_to :project

  enum priority: [:high, :normal, :low]

  after_initialize :set_defaults
  
  def set_defaults
    if self.new_record?
      self.priority ||= :normal
    end
  end

  def self.total
    Todo.all.size
  end
end
