module Admin
  class UsersController < AdminController
    before_action :find_users, only: [:index]
    before_action :find_user, only: [:edit, :update, :destroy]

    def index
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(premitted_params[:user])

      if @user.save
        redirect_to admin_users_path
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @user.update_attributes(premitted_params[:user])
        redirect_to admin_users_path
      else
        render 'edit'
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path
    end

    private

    def find_users
      @users = User.all.paginate(page: params[:page])
    end

    def find_user
      @user = User.find(params[:id])
    end

    def premitted_params
      params.permit(user: [:email, :password, :password_confirmation])
    end
  end
end
