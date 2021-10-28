module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update reset_password destroy]

      def index
        @users      = User.ransack(params[:q]).result
        @users      = @users.page(params[:page] || 1).per(params[:per_page] || 10)
        serial_user = @users.map { |user| UserSerializer.new(user, root: false) }

        response_pagination(serial_user, @users, 'User List')
      end

      def show
        response_success('User', UserSerializer.new(@user))
      end

      def create
        user = User.new(user_params)

        if user.save
          response_success('Add New User Succeed', UserSerializer.new(user), 201)
        else
          response_error('Add New User Failed', user.errors.full_messages)
        end
      end

      def update
        if @user.update(user_params)
          response_success('Update User Succeed', UserSerializer.new(@user))
        else
          response_error('Update User Failed', @user.errors.full_messages)
        end
      end

      def reset_password
        if @user.update(reset_password_params)
          response_success('Update Password User Succeed', UserSerializer.new(@user))
        else
          response_error('Update Password User Failed', @user.errors.full_messages)
        end
      end

      def destroy
        return unless @user.destroy

        response_success('Delete User Succeed')
      end

      private

      def set_user
        @user = User.find(params[:id])
      rescue StandardError
        response_error('User Error', 'Data not found')
      end

      def user_params
        params.require(:user)
              .permit(:name, :email, :password, :phone_number, :flat_id)
      end

      def reset_password_params
        params.require(:user)
              .permit(:password, :change_password, :password_confirmation, :current_password)
      end
    end
  end
end
