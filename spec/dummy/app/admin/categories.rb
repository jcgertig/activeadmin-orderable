ActiveAdmin.register Category do
  include ActiveAdmin::SortableTable
  permit_params :id, :number
  config.sort_order = 'number_asc'
  config.per_page = 3

  index do
    handle_column
    id_column
    column :number
    actions
  end
end
