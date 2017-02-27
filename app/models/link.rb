class Link < ApplicationRecord
  belongs_to :task, inverse_of: :links

  validates :task, presence: true
  validates :url, presence: true
end
