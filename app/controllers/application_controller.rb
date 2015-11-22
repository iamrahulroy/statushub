class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_categories

  private
  # OPTIMIZE: This would be an anti pattern for bigger application.
  # Solution: Create a new controller & place these methods inside that
  # controller and finally inherit from that controller
  def get_categories
    @categories = Category.all
  end
end
