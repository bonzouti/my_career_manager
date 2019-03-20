class User < ApplicationRecord
  after_create :welcome_send
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :applications
  has_many :steps, through: :applications

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "please enter a valid e-mail adress" }
  validates :password, presence: true, length: {minimum: 6}   

  has_one_attached :resume        

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
