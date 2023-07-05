require 'spec_helper'

RSpec.describe 'categories/index.html.erb', type: :view do
  let(:user) { create(:user) }
  let!(:groups) { create_list(:group, 3, user:) }

  before do
    assign(:user, user)
    assign(:groups, groups)
    render
  end

  it 'displays the categories header' do
    expect(rendered).to have_content('CATEGORIES')
  end

  it 'displays the list of categories' do
    expect(rendered).to have_selector('.category-card', count: 3)

    groups.each do |group|
      expect(rendered).to have_link(group.name, href: group_expenses_path(group))
      expect(rendered).to have_content(group.created_at.strftime('%d %b %Y'))
      expect(rendered).to have_content(number_to_currency(group.expenses.sum(:amount), precision: 2))
    end

    expect(rendered).to have_link('ADD CATEGORY', href: new_group_path)
  end

  it 'displays a message when no categories exist' do
    assign(:groups, [])
    render
    expect(rendered).to have_content('No category exists')
  end
end
