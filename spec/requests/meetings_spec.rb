# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe('/meetings', type: :request) do
  # This should return the minimal set of attributes required to create a valid
  # Meeting. As you add validations to Meeting, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'Test Meeting',
      start_time: 'Thu, 03 Nov 2022 23:40:00.000000000 CDT -05:00',
      end_time: 'Thu, 03 Nov 2022 23:59:00.000000000 CDT -05:00',
      description: 'Test description'
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      start_time: 'Thu, 03 Nov 2022 23:40:00.000000000 CDT -05:00',
      end_time: 'Thu, 03 Nov 2022 23:59:00.000000000 CDT -05:00',
      description: 'Test description'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Meeting.find_or_create_by!(valid_attributes)
      get meetings_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      meeting = Meeting.find_or_create_by!(valid_attributes)
      get meeting_url(meeting)
      expect(response).to(be_successful)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_meeting_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      meeting = Meeting.find_or_create_by!(valid_attributes)
      get edit_meeting_url(meeting)
      expect(response).to(be_successful)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Meeting' do
        expect do
          post(meetings_url, params: { meeting: valid_attributes })
        end.to(change(Meeting, :count).by(1))
      end

      it 'redirects to the created meeting' do
        post meetings_url, params: { meeting: valid_attributes }
        expect(response).to(redirect_to(meeting_url(Meeting.last)))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Meeting' do
        expect do
          post(meetings_url, params: { meeting: invalid_attributes })
        end.to(change(Meeting, :count).by(0))
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post meetings_url, params: { meeting: invalid_attributes }
        expect(response.body).to(include('New Meeting'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Test Meeting',
          start_time: 'Thu, 03 Nov 2022 23:40:00.000000000 CDT -05:00',
          end_time: 'Thu, 03 Nov 2022 23:59:00.000000000 CDT -05:00',
          description: 'Test description2'
        }
      end

      it 'updates the requested meeting' do
        meeting = Meeting.find_or_create_by!(valid_attributes)
        patch meeting_url(meeting), params: { meeting: new_attributes }
        meeting.reload
        follow_redirect!
        expect(response.body).to(include('Test description2'))
      end

      it 'redirects to the meeting' do
        meeting = Meeting.find_or_create_by!(valid_attributes)
        patch meeting_url(meeting), params: { meeting: new_attributes }
        meeting.reload
        expect(response).to(redirect_to(meeting_url(meeting)))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        meeting = Meeting.find_or_create_by!(valid_attributes)
        patch meeting_url(meeting), params: { meeting: invalid_attributes }
        expect(response.body).to(include('Editing Meeting'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested meeting' do
      meeting = Meeting.find_or_create_by!(valid_attributes)
      expect do
        delete(meeting_url(meeting))
      end.to(change(Meeting, :count).by(-1))
    end

    it 'redirects to the meetings list' do
      meeting = Meeting.find_or_create_by!(valid_attributes)
      delete meeting_url(meeting)
      expect(response).to(redirect_to(meetings_url))
    end
  end
end
