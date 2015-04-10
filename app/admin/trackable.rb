ActiveAdmin.register Trackable do
  menu parent: "Admin", priority: 140, if: proc{ current_user.admin? }
  permit_params :provider_id, :type, :auth_dependent

  config.sort_order = "id_asc"

  index do
    selectable_column
    id_column
    column :provider, sortable: :provider_id
    column :type
    column :auth_dependent
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :provider, include_blank: false
      f.input :type, as: :select, collection: Trackable.descendants, include_blank: false
      f.input :auth_dependent
    end

    f.actions
  end
end
