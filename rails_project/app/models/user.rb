class User < ActiveRecord::Base
  has_many :photos

  serialize :omniauth_auth, JSON

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["info"]["id"], provider: auth_hash["provider"])
    if !user.nil?
      return user
    else
      user = User.new
      user.auth_hash = auth_hash
      user.uid = auth_hash["info"]['id']
      user.provider = auth_hash['provider']
      user.name = auth_hash["info"]["display_name"]

      if user.save
        return user
      else
        return nil
      end
    end
  end
end
