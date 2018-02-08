class Project < ApplicationRecord
  validates :name, presence: true
  validates :rating, :inclusion => { :in => 1..5 }, :allow_nil => true

  enum status: [:open, :close] 

  has_many :todos
  has_many :milestones

  after_initialize :set_defaults
  
  def to_s
    "project #{name}"
  end

  def self.with_todos
    Project.where id: Todo.all.map(&:project_id)
  end

  def self.total
    Project.all.size
  end

  def set_defaults
    if self.new_record?
      self.status ||= :open
    end
  end
end
