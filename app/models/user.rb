class User < ApplicationRecord
  has_many :page_visits

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
