ActiveAdmin.register Campaign do
  menu priority: 10
  permit_params :name

  form do |f|
    f.inputs "Details" do
      f.input :name
    end

    f.actions
  end
end
