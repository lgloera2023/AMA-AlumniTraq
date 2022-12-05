# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('meetings/list', type: :view) do
  before do
    assign(:meetings, [
      Meeting.find_or_create_by!(
        name: 'Name',
        start_time: 'Thu, 03 Nov 2022 23:40:00.000000000 CDT -05:00',
        end_time: 'Thu, 03 Nov 2022 23:59:00.000000000 CDT -05:00',
        description: 'MyText'
      ),
      Meeting.find_or_create_by!(
        name: 'Name',
        start_time: 'Thu, 04 Nov 2022 23:40:00.000000000 CDT -05:00',
        end_time: 'Thu, 04 Nov 2022 23:59:00.000000000 CDT -05:00',
        description: 'MyText'
      )
    ]
    )
  end

  it 'renders a list of meetings' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
