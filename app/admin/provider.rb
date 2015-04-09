ActiveAdmin.register Provider do
  menu parent: "Admin", priority: 120, if: proc{ current_user.admin? }
end
