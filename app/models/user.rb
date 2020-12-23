class User < ApplicationRecord
  has_secure_password
    
  has_many :help_requests

  validates :name, :email, presence: true

  validates :email, uniqueness: true


 


end
