class Users::RegistrationsController < Devise::RegistrationsController
  #overriden controller code courtesy of devise wiki
  def update
    @user = User.find(current_user.id)

    if !needs_password?(@user, params)
      params[:user][:password] = params[:user][:current_password]
      params[:user][:password_confirmation] = params[:user][:current_password]
    end

    successfully_updated = if needs_password?(@user, params)
                             @user.update_with_password(params[:user])
                           else
                             params[:user].delete(:current_password)
                             @user.update_without_password(params[:user])
                           end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      render "users/show"
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
        !params[:user][:password].blank?
  end
end
