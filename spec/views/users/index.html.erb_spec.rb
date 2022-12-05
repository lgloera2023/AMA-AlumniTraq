# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('users/index', type: :view) do
  # Get the
  admin_user = get_admin_user
  Current.user = admin_user

  before do
    assign(:users, [
      User.find_or_create_by!(
        email: 'member1@test.com',
        role_id: 2,
        first_name: 'Test',
        last_name: 'User',
        major_id: 1,
        graduation_year: 2023,
        phone: '8328675309',
        is_approved: true
      ),
      User.find_or_create_by!(
        email: 'member2@test.com',
        role_id: 2,
        first_name: 'Test',
        last_name: 'User',
        major_id: 1,
        graduation_year: 2023,
        phone: '8328675309',
        is_approved: true
      )
    ]
    )
  end

  it 'renders a list of users' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Test'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('User'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Member'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('International Studies'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2023.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('@test.com'.to_s), count: 2
  end
end
