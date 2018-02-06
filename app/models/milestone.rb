class Milestone < ApplicationRecord
  valdates :label, presence :true
  validates :deadline, presence :true
  
  belongs_to :project
end
