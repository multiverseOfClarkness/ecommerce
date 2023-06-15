class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  belongs_to :role, foreign_key: :role_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  
  
end
