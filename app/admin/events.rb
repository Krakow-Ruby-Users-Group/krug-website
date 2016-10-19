# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Event do
  config.filters = false

  permit_params :name,
    :rsvp_limit,
    :status,
    :time,
    :created,
    :link,
    :description,
    :bootsy_image_gallery_id

  index do
    selectable_column
    id_column
    column :name
    column :rvsp_limit
    column :status
    column :time
    column :created
    column :link
    actions
  end

  show do
    attributes_table do
      row :name
      row :rvsp_limit
      tag_row :status
      row :time
      row :created
      row :link do
        link_to event.link
      end
    end
    div do
      simple_format event.description&.html_safe
    end
  end

  form do |f|
    f.inputs class: 'attributes_table col-md-10' do
      div do
        f.label :time
        f.input :time, as: :date_time_picker, label: false
      end
      div do
        f.label :description
        f.bootsy_area :description
      end
    end
    f.actions
  end

  action_item only: :index do
    link_to 'Import meetup events', action: :event_import
  end

  collection_action :event_import, method: :get do
    EventsService.new.call
    redirect_to collection_path, notice: 'Events imported successfully!'
  end
end
# rubocop:enable Metrics/BlockLength
