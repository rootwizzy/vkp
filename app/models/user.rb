class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[discord]
    def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.username = auth.info.username
			# user.password = Devise.friendly_token[0, 20]
			# user.name = auth.info.name   # assuming the user model has a name
			# user.image = auth.info.image # assuming the user model has an image
			# If you are using confirmable and the provider(s) you use validate emails, 
			# uncomment the line below to skip the confirmation emails.
			# user.skip_confirmation!
		  end
	end

	def self.new_with_session(params, session)
		super.tap do |user|
		  if data = session["devise.discord_data"] && session["devise.discord_data"]["extra"]["raw_info"]
			user.username = data["username"] if user.username.blank?
		  end
		end
	end
end
