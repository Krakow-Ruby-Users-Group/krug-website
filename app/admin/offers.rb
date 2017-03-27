# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Offer do
  belongs_to :sponsor, optional: true

  config.filters = false
  menu false

  permit_params :title,
    :description,
    :bootsy_image_gallery_id

  index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :created
    end
    div do
      simple_format offer.description&.html_safe
    end
  end

  form do |f|
    f.inputs class: 'attributes_table col-md-10' do
      f.input :title
      div do
        f.label :description
        f.bootsy_area :description
      end
    end
    f.actions
  end
end
# rubocop:enable Metrics/BlockLength
