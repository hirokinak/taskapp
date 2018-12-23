class Admin::UsersController < ApplicationController
  before_action :check_roll
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(created_at: :asc).page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    return redirect_to admin_users_url, notice: "管理者を削除することはできません。" if User.count <= 1
      @user.destroy
      redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation, :tasks_count)
    end

    def check_roll
      redirect_to root_path unless current_user.admin?
    end
end
