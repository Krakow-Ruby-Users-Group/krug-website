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
    actions
  end

  show do
    attributes_table do
      row :title
    end
    div class: 'col-md-8' do
      markdown(offer.description)
    end
  end

  form do |f|
    f.inputs class: 'attributes_table col-md-10' do
      f.input :title
      f.input :description
    end

    f.actions
    div do
      link_to 'Styling with Markdown is supported',
        'https://guides.github.com/features/mastering-markdown/', target: '_blank'
    end
  end
end
# rubocop:enable Metrics/BlockLength
