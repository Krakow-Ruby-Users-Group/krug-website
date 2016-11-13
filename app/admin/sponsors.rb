# rubocop:disable Metrics/BlockLength
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
      image_tag sponsor.logo.thumb.url
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
      row :logo do
        image_tag sponsor.logo.thumb.url
      end
    end
  end

  form do |f|
    f.inputs 'Sponsor Details' do
      f.input :name
      f.input :logo, as: :file #, hint: image_tag(f.object.logo.thumb.url)
      f.input :url
      f.input :description
    end
    f.actions
  end
end
# rubocop:enable Metrics/BlockLength
