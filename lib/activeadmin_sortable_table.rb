require 'activeadmin'

module ActiveAdmin
  # Include this module to registered page to enable
  # ActiveAdmin Sortable Table extension
  # @example
  #
  #  ActiveAdmin.register Category do
  #    include ActiveAdmin::SortableTable
  #    config.sort_order = 'position_asc'
  #    permit_params :position
  #
  #    index do
  #      handle_column
  #      id_column
  #    end
  # end
  #
  module SortableTable
    require 'active_admin/sortable_table/version'
    require 'active_admin/sortable_table/engine'
    require 'active_admin/sortable_table/handle_column'

    class << self
      # @param [ActiveAdmin::DSL] dsl
      # @return [void]
      #
      def included(dsl)
        dsl.instance_eval do
          member_action :sort, method: :post do
            resource.insert_at params[:position].to_i
            head 200
          end
        end
      end
    end
  end
end