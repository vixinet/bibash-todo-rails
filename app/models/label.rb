class Label < ApplicationRecord
  validates :label, presence: true
  validates_format_of :color, :with => /^#([0-9a-f]{3}|[0-9a-f]{6})$/i, :multiline => true

  has_and_belongs_to_many :projects
end
