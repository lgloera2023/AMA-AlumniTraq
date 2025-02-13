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

RSpec.describe('/job_categories', type: :request) do
  admin_user = get_admin_user
  login_user(admin_user)
  # This should return the minimal set of attributes required to create a valid
  # JobCategory. As you add validations to JobCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: 'Valid name'
    }
  end

  let(:invalid_attributes) do
    {
      name: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      JobCategory.find_or_create_by!(valid_attributes)
      get job_categories_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      job_category = JobCategory.find_or_create_by!(valid_attributes)
      get job_category_url(job_category)
      expect(response).to(be_successful)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_job_category_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      job_category = JobCategory.find_or_create_by!(valid_attributes)
      get edit_job_category_url(job_category)
      expect(response).to(be_successful)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new JobCategory' do
        expect do
          post(job_categories_url, params: { job_category: valid_attributes })
        end.to(change(JobCategory, :count).by(1))
      end

      it 'redirects to the created job_category' do
        post job_categories_url, params: { job_category: valid_attributes }
        expect(response).to(redirect_to(job_category_url(JobCategory.last)))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new JobCategory' do
        expect do
          post(job_categories_url, params: { job_category: invalid_attributes })
        end.to(change(JobCategory, :count).by(0))
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post job_categories_url, params: { job_category: invalid_attributes }
        expect(response.body).to(include('New Job Category'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Valid name2'
        }
      end

      it 'updates the requested job_category' do
        job_category = JobCategory.find_or_create_by!(valid_attributes)
        patch job_category_url(job_category), params: { job_category: new_attributes }
        job_category.reload
        follow_redirect!
        expect(response.body).to(include('Valid name2'))
      end

      it 'redirects to the job_category' do
        job_category = JobCategory.find_or_create_by!(valid_attributes)
        patch job_category_url(job_category), params: { job_category: new_attributes }
        job_category.reload
        expect(response).to(redirect_to(job_category_url(job_category)))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        job_category = JobCategory.find_or_create_by!(valid_attributes)
        patch job_category_url(job_category), params: { job_category: invalid_attributes }
        expect(response.body).to(include('Editing Job Category'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested job_category' do
      job_category = JobCategory.find_or_create_by!(valid_attributes)
      expect do
        delete(job_category_url(job_category))
      end.to(change(JobCategory, :count).by(-1))
    end

    it 'redirects to the job_categories list' do
      job_category = JobCategory.find_or_create_by!(valid_attributes)
      delete job_category_url(job_category)
      expect(response).to(redirect_to(job_categories_url))
    end
  end
end
