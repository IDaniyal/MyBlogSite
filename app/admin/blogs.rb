ActiveAdmin.register Blog do

  form do |f|
    f.inputs "Blog Details" do
      f.label :title
      f.text_field :title, :readonly => true

      f.input :is_approved
      f.label :content
      f.text_field :content, :readonly => true
    end
    f.submit
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :is_approved
  actions :all, except: [:create, :new]

  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :user_id, :is_approved]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
