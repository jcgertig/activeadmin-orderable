[![Build Status](https://travis-ci.org/bolshakov/activeadmin_sortable_table.svg?branch=master)](https://travis-ci.org/bolshakov/activeadmin_sortable_table)
[![Test Coverage](https://codeclimate.com/github/bolshakov/activeadmin_sortable_table/badges/coverage.svg)](https://codeclimate.com/github/bolshakov/activeadmin_sortable_table/coverage)
[![Code Climate](https://codeclimate.com/github/bolshakov/activeadmin_sortable_table/badges/gpa.svg)](https://codeclimate.com/github/bolshakov/activeadmin_sortable_table)
[![Gem Version](https://badge.fury.io/rb/activeadmin_sortable_table.svg)](http://badge.fury.io/rb/activeadmin_sortable_table)

# Active Admin Sortable Table

This gem extends ActiveAdmin so that your index page's table rows can be
orderable via a drag-and-drop interface.

## Improvements over the @neo version

1. Test coverage 
2. Configurable labels for handler 
3. Move to top button allows to push any item from any page to the top of the list
4. Sorting works on all pages ( not only on the first one)

## Prerequisites

This extension assumes that you're using [acts_as_list](https://github.com/swanandp/acts_as_list) on any model you want to be sortable.

```ruby
class Page < ActiveRecord::Base
  acts_as_list
end
```

## Usage

Add it to your Gemfile

```ruby
gem "activeadmin_sortable_table"
```

Include the JavaScript in `active_admin.js.coffee`

```coffeescript
#= require activeadmin_sortable_table
```

Include the Stylesheet in `active_admin.css.scss`

```scss
@import "activeadmin_sortable_table"
```

### Configure your ActiveAdmin Resource

```ruby
ActiveAdmin.register Page do
  include ActiveAdmin::SortableTable # creates the controller action which handles the sorting
  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column

  index do
    handle_column 
  end

  show do |c|
    attributes_table do
      row :id
      row :name
    end

    panel 'Contents' do
      table_for c.collection_memberships do
        handle_column
        column :position
        column :collectable
      end
    end
  end
end
```

### Configure handler

You can override handler column symbol using handle_column options:

You can configure `sort_url` using handle column options by providing static value, symbolized instance method name, or blocks. 

```ruby
handle_column sort_url: ->(category) { compute_url_for_category(category) }  
handle_column sort_url: '/admin/categories/1/sort'
handle_column sort_url: :sort_category  
```

The same options available for `move_to_top_url`:

```ruby
handle_column move_to_top_url: '/admin/categories/1/move_to_top
```

It's also possible to override handle lables:

```ruby
handle_column sort_handle: '&#9776;'.html_safe
handle_column move_to_top_handle: 'Move to top'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Prepare tests database (`bundle exec rake dummy:prepare`)
4. Make your changes and runs specs (`bundle exec rspec`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create Pull Request
