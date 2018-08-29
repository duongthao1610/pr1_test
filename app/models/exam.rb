class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :results, dependent: :destroy
end
