module ApplicationHelper
  def avatar_url(user)
  	gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    if gravatar_id
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=50"

      
    end
  end
end
