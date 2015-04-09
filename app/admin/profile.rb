ActiveAdmin.register Profile do
  menu parent: "Admin", priority: 130, if: proc{ current_user.admin? }
end
