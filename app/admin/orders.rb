ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :subtotal, :total

  form do |f|
    f.semantic_errors
    f.inputs
    f.actions

  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:subtotal, :total]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
