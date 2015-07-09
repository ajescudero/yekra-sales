class User < ActiveRecord::Base
	has_many :purchases
	before_save :set_approved

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

private

	def set_approved
		self[:approved] = true
	end
end
