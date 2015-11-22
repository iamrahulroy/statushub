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

end
