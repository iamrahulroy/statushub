module UsersHelper
  def is_vegan?(user)
    user.is_veg ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-remove'
  end

  def drink?(user)
    user.drink ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-remove'
  end

  def weight_in_kg(weight)
    weight / 1000
  end
end
