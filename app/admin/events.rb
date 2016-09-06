ActiveAdmin.register Event do
  permit_params :name,
    :rsvp_limit,
    :status,
    :time,
    :created,
    :link,
    :description
end
