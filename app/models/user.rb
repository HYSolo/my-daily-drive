class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:spotify]
  
  has_many :playlists, dependent: :destroy
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.country = auth.info.country_code
      user.spotify_url = auth.info.urls.spotify
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
