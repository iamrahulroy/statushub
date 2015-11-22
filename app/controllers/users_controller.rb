class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
    @users = User.vegans.paginate(page: params[:page], per_page: 10) if params[:vegan].present?
  end

  def search
    @users = User.search do
      fulltext params[:query]
    end.results
    render 'index'
  end
end
