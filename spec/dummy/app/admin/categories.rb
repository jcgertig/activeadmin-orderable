ActiveAdmin.register Category do
  include ActiveAdmin::SortableTable
  permit_params :id, :position
  config.sort_order = 'position_asc'
  config.per_page = 3

  index do
    handle_column
    id_column
    column :position
    actions
  end
end
