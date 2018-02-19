class Task < ApplicationRecord
  validates :label, presence: true
  validates_uniqueness_of :label, scope: :todo_id
  belongs_to :todo
  has_one :project, through: :todo
end
