class UsersController < ApplicationController
  def index
    @users = User.includes(:category).paginate(page: params[:page], per_page: 10)
    @users = User.includes(:category).vegans.paginate(page: params[:page], per_page: 10) if params[:vegan].present?
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.pdf do
        pdf = UserPdf.new(@user, view_context)
        send_data pdf.render, filename: "user_#{@user.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def search
    @users = User.search(params[:query]).paginate(page: params[:page], per_page: 10)
    render 'index'
  end
end
