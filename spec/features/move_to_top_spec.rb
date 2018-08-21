RSpec.describe ActiveAdmin::SortableTable, 'Move to top', type: :feature, js: true do
  before do
    Category.create!
    Category.create!
    Category.create!
    Category.create!
  end

  def ordered_ids
    Category.order(:number).pluck(:id)
  end

  before do
    expect(ordered_ids).to eq([1, 2, 3, 4])

    # Initially only one element on the second page
    visit admin_categories_path(page: 2)

    expect(visible_ids).to contain_exactly(4)
    expect(visible_numbers).to contain_exactly(4)
  end

  it 'push element to top by clicking "move to top"' do
    # When I push "move to top" button
    move_to_top(4)

    # The last element from the previous page should be shown
    # save_and_open_page
    expect(visible_ids).to contain_exactly(3)

    # And when I visit previous page
    visit admin_categories_path(page: 1)

    # I should see pushed elenent on the top
    expect(visible_ids).to eq([4, 1, 2])
    expect(visible_numbers).to eq([1, 2, 3])
    expect(ordered_ids).to eq([4, 1, 2, 3])
  end

  private

  def visible_ids
    all('.ui-sortable .col-id').map(&:text).map(&:to_i)
  end

  def visible_numbers
    all('.ui-sortable .col-number').map(&:text).map(&:to_i)
  end

  def move_to_top(element_id)
    within "#category_#{element_id}" do
      first('.move_to_top').click
    end
  end
end
