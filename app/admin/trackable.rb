ActiveAdmin.register Trackable do
  menu parent: "Admin", priority: 140, if: proc{ current_user.admin? }
end
