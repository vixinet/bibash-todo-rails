class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  def to_s
    "project #{name}"
  end
end
