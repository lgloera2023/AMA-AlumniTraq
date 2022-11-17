# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('alumni/index', type: :view) do
  admin_user = get_admin_user
  Current.user = admin_user

  destroy_if User.find_by(email: 'alumnus1@test.com')
  destroy_if User.find_by(email: 'alumnus2@test.com')

  alumnus_user1 = User.find_or_create_by!(
    email: 'alumnus1@test.com',
    role_id: 3,
    first_name: 'Test',
    last_name: 'Alumnus1',
    major_id: 1,
    graduation_year: 1991,
    phone: '8328675309',
    is_approved: true
  )
  alumnus_user2 = User.find_or_create_by!(
    email: 'alumnus2@test.com',
    role_id: 3,
    first_name: 'Test',
    last_name: 'Alumnus2',
    major_id: 1,
    graduation_year: 1991,
    phone: '8328675309',
    is_approved: true
  )

  unless alumnus_user1.alumnus
    Alumnus.find_or_create_by!(
      user: alumnus_user1,
      bio: 'MyBio',
      job_title: 'Job Title',
      job_category_id: 1,
      employer: 'Employer',
      availability: 'MyText'
    )
  end

  unless alumnus_user2.alumnus
    Alumnus.find_or_create_by!(
      user: alumnus_user2,
      bio: 'MyBio',
      job_title: 'Job Title',
      job_category_id: 1,
      employer: 'Employer',
      availability: 'MyText'
    )
  end

  before do
    assign(:users, [alumnus_user1, alumnus_user2])
  end

  it 'renders a list of alumni' do
    @users = User.alumni_users.order(:last_name)
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Test Alumnus'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Job Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Employer'.to_s), count: 2
  end
end
