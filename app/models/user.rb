class User < ActiveRecord::Base
  devise :rememberable, :omniauthable, :trackable,
         :omniauth_providers => [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    puts access_token.inspect
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(name: data["name"],
              email: data["email"],
              provider: access_token.provider,
              uid: access_token.uid,
              picture: data["image"] || data["picture"]
            )
    end

    unless user.picture
      user.picture = data["image"] || data["picture"]
      user.save
    end

    user
  end
end
