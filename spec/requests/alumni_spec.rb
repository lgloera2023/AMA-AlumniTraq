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

RSpec.describe "/alumni", type: :request do
  admin_user = get_admin_user()
  alumnus_user = get_alumnus_user()
  login_user(admin_user)

  # This should return the minimal set of attributes required to create a valid
  # Alumnus. As you add validations to Alumnus, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      user_id: alumnus_user.id,
      bio: "Valid bio",
      job_title: "Valid Job Title",
      job_category_id: 1,
      employer: "Valid Employer",
      availability: "Valid availability"
    }
  }

  let(:invalid_attributes) {
    {
      user_id: 0,
      bio: "Valid bio",
      job_title: "Valid Job Title",
      job_category_id: 1,
      employer: "Valid Employer",
      availability: "Valid availability"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      login_user(admin_user)
      Alumnus.create! valid_attributes
      get alumni_url
      expect(response).to have_http_status(200) #be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      alumnus = Alumnus.create! valid_attributes
      get alumnus_url(alumnus)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_alumnus_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      alumnus = Alumnus.create! valid_attributes
      get edit_alumnus_url(alumnus)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Alumnus" do
        expect {
          post alumni_url, params: { alumnus: valid_attributes }
        }.to change(Alumnus, :count).by(1)
      end

      it "redirects to the created alumnus" do
        post alumni_url, params: { alumnus: valid_attributes }
        expect(response).to redirect_to(alumnus_url(Alumnus.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Alumnus" do
        expect {
          post alumni_url, params: { alumnus: invalid_attributes }
        }.to change(Alumnus, :count).by(0)
      end

    
      it "renders a successful response (i.e. to display the 'new' template)" do
        post alumni_url, params: { alumnus: invalid_attributes }
        expect(response.body).to include("New Alumnus")
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested alumnus" do
        alumnus = Alumnus.create! valid_attributes
        patch alumnus_url(alumnus), params: { alumnus: new_attributes }
        alumnus.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the alumnus" do
        alumnus = Alumnus.create! valid_attributes
        patch alumnus_url(alumnus), params: { alumnus: new_attributes }
        alumnus.reload
        expect(response).to redirect_to(alumnus_url(alumnus))
      end
    end

    context "with invalid parameters" do
    
      it "renders a successful response (i.e. to display the 'edit' template)" do
        alumnus = Alumnus.create! valid_attributes
        patch alumnus_url(alumnus), params: { alumnus: invalid_attributes }
        expect(response.body).to include("Editing Alumnus")
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested alumnus" do
      alumnus = Alumnus.create! valid_attributes
      expect {
        delete alumnus_url(alumnus)
      }.to change(Alumnus, :count).by(-1)
    end

    it "redirects to the alumni list" do
      alumnus = Alumnus.create! valid_attributes
      delete alumnus_url(alumnus)
      expect(response).to redirect_to(alumni_url)
    end
  end
end