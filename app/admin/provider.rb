ActiveAdmin.register Provider do
  menu parent: "Admin", priority: 120, if: proc{ current_user.admin? }
  permit_params :name

  config.sort_order = "name_asc"

  index do
    selectable_column
    id_column
    column :name
    column :trackables, :trackables_count
    column :updated_at
    actions
  end
end
