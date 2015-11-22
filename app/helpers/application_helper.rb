module ApplicationHelper
  def add_or_remove_favorite(user, favorite)
    if user.favorites.include? favorite
      link_to 'Remove', user_favorite_path(user), method: :delete, class: 'btn btn-danger'
    else
      link_to "Favorite", user_favorites_path(favorite_id: user), method: :post, class: 'btn btn-info'
    end
  end
end
