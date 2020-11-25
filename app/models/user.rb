class User < ApplicationRecord
  has_many :pages
  has_many :visits, through: :pages
end
