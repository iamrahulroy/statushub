class CategoriesController < ApplicationController
  before_action :get_category, only: [:show]

  def show
    @users = @category.users.paginate(page: params[:page], per_page: 10).order('id DESC')
  end

  private
  def get_category
    @category = Category.find(params[:id])
  end
end
