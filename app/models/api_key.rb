class ApiKey < ApplicationRecord
  belongs_to :user

  validates :token, presence: true, uniqueness: true

  def self.user_token
    first.token
  end
end
