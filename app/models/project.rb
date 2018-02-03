class Project < ApplicationRecord
  validates :name, presence: true
  validates :rating, :inclusion => { :in => 1..5 }, :allow_nil => true

  has_many :todos
  
  def to_s
    "project #{name}"
  end

  def self.with_todos
    Project.where id: Todo.all.map(&:project_id)
  end

  def self.total
    Project.all.size
  end
end
