require 'uber/options'

module ActiveAdmin
  #
  module SortableTable
    # Adds `handle_column` method to `TableFor` dsl.
    # @example on index page
    #   index do
    #     handle_column
    #     id_column
    #     # other columns...
    #   end
    #
    # @example table_for
    #   table_for c.collection_memberships do
    #     handle_column
    #     # other columns...
    #   end
    #
    module HandleColumn
      DEFAULT_OPTIONS = {
        move_to_top_url: ->(resource) { url_for([:move_to_top, :admin, resource]) },
        move_to_top_handle: '&#10514;'.html_safe,
        show_move_to_top_handle: ->(resource) { !resource.first? },
        sort_url: ->(resource) { url_for([:sort, :admin, resource]) },
        sort_handle: '&#9776;'.html_safe
      }

      # @param [Hash] arguments
      # @option arguments [Symbol, Proc, String] :sort_url
      # @option arguments [Symbol, Proc, String] :sort_handle
      # @option arguments [Symbol, Proc, String] :move_to_top_url
      # @option arguments [Symbol, Proc, String] :move_to_top_handle
      #
      def handle_column(arguments = {})
        defined_options = Uber::Options.new(DEFAULT_OPTIONS.merge(arguments))

        column '', class: 'activeadmin_sortable_table' do |resource|
          options = defined_options.evaluate(self, resource)

          sort_handle(options, resource.position) + move_to_top_handle(options)
        end
      end

      private

      def sort_handle(options, position)
        content_tag(:span, options[:sort_handle],
                    class: 'handle',
                    'data-sort-url' => options[:sort_url],
                    'data-position' => position,
                    title: 'Drag to reorder'
                   )
      end

      def move_to_top_handle(options)
        link_to_if(options[:show_move_to_top_handle], options[:move_to_top_handle], options[:move_to_top_url],
                   method: :post,
                   class: 'move_to_top',
                   title: 'Move to top') { '' }
      end
    end

    ::ActiveAdmin::Views::TableFor.send(:include, HandleColumn)
  end
end
