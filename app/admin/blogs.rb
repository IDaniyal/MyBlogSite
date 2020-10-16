ActiveAdmin.register Blog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content, :user_id
  #
  # or
  #
  actions :all, except: [:destroy]

  permit_params do
    permitted = [:title, :content]
    permitted << :other if params[:action] == 'create' && current_user.superadmin?
    permitted
  end
  
end
