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

RSpec.describe('/event_attendees', type: :request) do
  meeting = get_meeting
  admin_user = get_admin_user
  login_user(admin_user)

  # This should return the minimal set of attributes required to create a valid
  # EventAttendee. As you add validations to EventAttendee, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      meeting_id: meeting.id,
      user_id: admin_user.id
    }
  end

  let(:invalid_attributes) do
    {
      meeting_id: 0,
      user_id: admin_user.id
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      EventAttendee.find_or_create_by!(valid_attributes)
      get event_attendees_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      event_attendee = EventAttendee.find_or_create_by!(valid_attributes)
      get event_attendee_url(event_attendee)
      expect(response).to(be_successful)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_event_attendee_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      event_attendee = EventAttendee.find_or_create_by!(valid_attributes)
      get edit_event_attendee_url(event_attendee)
      expect(response).to(be_successful)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new EventAttendee' do
        expect do
          post(event_attendees_url, params: valid_attributes)
        end.to(change(EventAttendee, :count).by(1))
      end

      it 'redirects to the created event_attendee' do
        post event_attendees_url, params: valid_attributes
        expect(response).to(redirect_to(event_attendee_url(EventAttendee.last)))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new EventAttendee' do
        expect do
          post(event_attendees_url, params: invalid_attributes)
        end.to(change(EventAttendee, :count).by(0))
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post event_attendees_url, params: invalid_attributes
        expect(response.body).to(include('New Event Attendee'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested event_attendee' do
      event_attendee = EventAttendee.find_or_create_by!(valid_attributes)
      expect do
        delete(event_attendee_url(event_attendee))
      end.to(change(EventAttendee, :count).by(-1))
    end

    it 'redirects to the event_attendees list' do
      event_attendee = EventAttendee.find_or_create_by!(valid_attributes)
      delete event_attendee_url(event_attendee)
      expect(response).to(redirect_to(event_attendees_url))
    end
  end
end
