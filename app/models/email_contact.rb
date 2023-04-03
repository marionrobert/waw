class EmailContact < ApplicationRecord
  # Validation rules for email address
  EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}\z/
  validates :email, presence: true, format: { with: EMAIL_REGEX }
end
