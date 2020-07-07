class CompletionMessage < ApplicationRecord
  belongs_to :milestone
  validates :content, presence: true, length: { maximum: 250 }
end
