class UserFavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user_favorite, only: [:destroy]

  def index
    @favorites = current_user.favorites.includes(:category).paginate(page: params[:page], per_page: 10)
  end

  def create
    @user_favorite = current_user.user_favorites.find_or_initialize_by(favorite_id: params[:favorite_id])
    if @user_favorite.save
      flash[:notice] = 'Favorited!'
      redirect_to :back
    else
      flash[:error] = 'Not favorited!'
      redirect_to :back
    end
  end

  def destroy
    if @user_favorite.destroy
      redirect_to :back, notice: 'Removed from favorites'
    else
      redirect_to :back, notice: 'Unable to remove it.'
    end
  end

  private
  def get_user_favorite
    # debugger
    @user_favorite = current_user.user_favorites.find_by(favorite_id: params[:id])
  end

  def authenticate_user!
    unless current_user
      redirect_to root_path
    end
  end
end
