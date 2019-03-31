class ApiKey < ApplicationRecord
  belongs_to :user
  validates_presence_of :value
  validates :value, uniqueness: true
end
