ActiveAdmin.register Sponsor do
  config.filters = false

  permit_params :name,
    :url,
    :description,
    :logo

  index do
    selectable_column
    id_column
    column :name
    column :url
    column :description
    column :logo do |sponsor|
      image_tag sponsor.logo
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :url do
        link_to sponsor.url
      end
      row :description
      row :logo
    end
  end

  form do |f|
    f.inputs 'Sponsor Details' do
      f.input :name
      f.input :logo
      f.input :url
      f.input :description
    end
    f.actions
  end
end
