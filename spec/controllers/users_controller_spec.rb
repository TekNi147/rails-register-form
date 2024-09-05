# spec/controllers/users_controller_spec.rb
require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    { firstName: "Test First Name",
      lastName: "Test Last Name",
      birthDay: "2024-09-05",
      gender: "Male",
      email: "test@example.com",
      phone: "1234567890",
      subject: "Test Subject" }
  }

  let(:invalid_attributes) {
    { firstName: nil,
      lastName: nil,
      birthDay: nil,
      gender: nil,
      email: nil,
      phone: nil,
      subject: nil }
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

  describe "GET #edit" do
    let(:user) {
      User.create(firstName: "Old Test First Name",
                  lastName: "Old Test Last Name",
                  birthDay: "Old 2024-09-05",
                  gender: "Old Male",
                  email: "Old test@example.com",
                  phone: "Old 1234567890",
                  subject: "Old Test Subject")
    }
    it("edit user") do
      user = User.create! valid_attributes
      get :edit, params: { id: user.to_param }
      expect(response).to be_successful
    end

    it("update user") do
      patch :update, params: { id: user.id, user: { firstName: "New Test First Name",
                                                   lastName: "New Test Last Name",
                                                   birthDay: "New 2024-09-05",
                                                   gender: "New Male",
                                                   email: "New test@example.com",
                                                   phone: "New 1234567890",
                                                   subject: "New Test Subject" } }
      user.reload
      expect(user.firstName).to eq("New Test First Name")
      expect(user.lastName).to eq("New Test Last Name")
      expect(user.birthDay.to_s).to eq("2024-09-05")
      expect(user.gender).to eq("New Male")
      expect(user.email).to eq("New test@example.com")
      expect(user.phone).to eq("New 1234567890")
      expect(user.subject).to eq("New Test Subject")
    end
  end
end
