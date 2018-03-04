class User < ApplicationRecord
  has_many :repositories, dependent: :destroy

  validates_presence_of :name, :surname, :email
end
