class ApiKey < ApplicationRecord
  belongs_to :user
  validates :value, uniqueness: true
  validates_presence_of :value
end
