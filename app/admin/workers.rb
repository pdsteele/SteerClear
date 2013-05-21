ActiveAdmin.register Worker do

  form do |f|
    f.inputs "Worker Details" do
      f.input :name
      f.input :email, :hint => "Can be the same as their user Steer Clear account"
      f.input :phone
      f.input :password, :hint => "Can be the same as their user Steer Clear account"
      f.input :password_confirmation
      f.input :activeShift, :as => :hidden, :value => :false
    end
    f.buttons
  end

  #do not modify table until itr 3, since we may need confirmation or password reset keys for testing

end
