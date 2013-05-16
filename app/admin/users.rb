ActiveAdmin.register User do

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :text, :label => "Does the user want to receive alert texts?"
      f.input :phone
      f.input :onCampus, :label => "Does the user live on campus?"
      f.input :address, :hint => "Ensure that you input a valid building name if they live on campus"
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end

  #do not modify table until itr 3, since we may need confirmation or password reset keys for testing

end
