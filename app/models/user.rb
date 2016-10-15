class User < ActiveRecord::Base
	has_secure_password
	validates :email, presence: true, uniqueness: true, length: {in:5..50}

	validates :first_name, :last_name, :password, :password_confirmation, presence: true, length: { in: 3..20 }

end
