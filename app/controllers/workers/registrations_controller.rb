class Workers::RegistrationsController < Devise::RegistrationsController
  #overriden controller code courtesy of devise wiki

  def new
    flash[:error] = "WARNING: You must contact an administrator to create a worker account!"
    redirect_to "/workers"
  end

  def create
    flash[:error] = "WARNING: You must contact an administrator to create a worker account!"
    redirect_to "/workers"
  end

  def update
    @worker = Worker.find(current_worker.id)

    if !needs_password?(@worker, params)
      params[:worker][:password] = params[:worker][:current_password]
      params[:worker][:password_confirmation] = params[:worker][:current_password]
    end

    successfully_updated = if needs_password?(@worker, params)
                             @worker.update_with_password(params[:worker])
                           else
                             params[:worker].delete(:current_password)
                             @worker.update_without_password(params[:worker])
                           end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the worker bypassing validation in case his password changed
      sign_in @worker, :bypass => true
      render "workers/show"
    else
      render "edit"
    end
  end

  private

  # check if we need password to update worker data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(worker, params)
    worker.email != params[:worker][:email] ||
        !params[:worker][:password].blank?
  end
end
