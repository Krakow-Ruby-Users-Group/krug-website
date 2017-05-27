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

    column :job_offers do |sponsor|
      ul do
        li link_to sponsor.offers.count, admin_sponsor_offers_path(sponsor)
        li link_to 'Add', new_admin_sponsor_offer_path(sponsor)
      end
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

      row :job_offers do |sponsor|
        ul do
          li link_to sponsor.offers.count, admin_sponsor_offers_path(sponsor)
          li link_to 'Add', new_admin_sponsor_offer_path(sponsor)
        end
      end
    end
  end

  form do |f|
    f.inputs 'Sponsor Details' do
      f.input :name
      f.input :logo, as: :file
      f.input :url
      f.input :description
    end

    f.actions
  end
end
# rubocop:enable Metrics/BlockLength
