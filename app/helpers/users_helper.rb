module UsersHelper
  def is_vegan?(user)
    user.is_veg ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-remove'
  end

  def drink?(user)
    user.drink ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-remove'
  end

  def weight_in_kg(weight)
    weight.present? ? weight / 1000 : 'N/A'
  end
end
