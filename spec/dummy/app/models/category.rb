class Category < ActiveRecord::Base
  acts_as_list column: :number
end
