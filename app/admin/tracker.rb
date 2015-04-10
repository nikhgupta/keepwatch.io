ActiveAdmin.register Tracker do
  menu priority: 30
  permit_params :profile_id, :campaign_id, :trackable_id

  index do
    selectable_column
    id_column
    column :campaign, sortable: :campaign_id
    column :profile, sortable: :profile_id
    column :trackable, sortable: :trackable_id
    column :updated_at
    actions
  end
end
