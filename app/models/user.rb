# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  
  validates :name, presence: true,
                   length: { maximum: 25 }
  validates :email, presence: true,
                    length: { maximum: 49 },
                    uniqueness: true

  validates :password, presence: true,
                       length: { maximum: 29 }
end
