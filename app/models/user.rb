class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :set_default_role

  belongs_to :role, foreign_key: :role


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  private

  def set_default_role
    self.role ||= Role.second.id
  end
end
