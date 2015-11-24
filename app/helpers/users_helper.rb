module UsersHelper
  def is_vegan?(user)
    user.is_veg ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-remove'
  end

  def drink?(user)
    user.drink ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-remove'
  end

  def user_height(user)
    user.height ? user.height : 'N/A'
  end

  def weight_in_kg(weight)
    weight.present? ? weight / 1000 : 'N/A'
  end

  def user_status(user)
    user.status ? user.status : 'N/A'
  end

  def share_status(user)
    user.status ? social_share_button_tag(user.status) : social_share_button_tag(default_text)
  end

  def default_text
    'Checkout these cool status on Idfy Statushub'
  end

  def show_image(user)
    image_tag path(user), class: 'img-circle'
  end

  def path(user)
    image_value = user.image.url.split('/').last.to_i
    "http://idfy.0x10.info/api/avatar/#{image_value}.png"
  end

end
