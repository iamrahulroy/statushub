class CategoriesController < ApplicationController
  before_action :get_category, only: [:show]

  def index
    render
  end

  def show
    # TODO: Use users/index.html.erb template instead
    @users = @category.users.paginate(page: params[:page], per_page: 10).order('id DESC')
  end

  private
  def get_category
    @category = Category.find(params[:id])
  end
end
