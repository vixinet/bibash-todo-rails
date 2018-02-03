class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :rating, :inclusion => { :in => 1..5 }

  def to_s
    "project #{name}"
  end
end
