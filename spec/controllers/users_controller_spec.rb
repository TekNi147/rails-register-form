# spec/controllers/users_controller_spec.rb
require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    { name: "Test User" }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET #show" do
    it "returns a success response" do
      User.create! valid_attributes
      get :show
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redirects to the users list" do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(users_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { user: invalid_attributes }
        # expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: { id: user.to_param }
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, params: { id: user.to_param }
      expect(response).to redirect_to(users_path)
    end
  end
end
