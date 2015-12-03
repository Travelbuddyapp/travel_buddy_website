ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_id, :first_name, :last_name, :birth_date, :phone_number, :gender, :created_at, :updated_at, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :last_name
      f.input :birth_date
      f.input :phone_number
      f.input :gender
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
