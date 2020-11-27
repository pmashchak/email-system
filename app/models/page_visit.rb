class PageVisit < ApplicationRecord
  belongs_to :user

  validates :host, :path, presence: true
  validates :host, format: { with: /[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}/i }
end
