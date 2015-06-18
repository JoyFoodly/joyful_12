require 'spec_helper'

describe RegistrationsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'GET #new' do
    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'valid attributes' do
      it 'saves a new user in the database' do
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it 'redirects to charges#new' do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to new_payment_path
      end

      context 'with free coupon' do
        let(:coupon) { create(:free_coupon) }

        it 'redirects to  user to be onboarded' do
          post :create, { user: attributes_for(:user) }, partner_id: coupon.shareable_tag
          expect(response).to redirect_to edit_user_path(User.last.id)
        end
      end
    end

    context 'invalid attributes' do
      it 'does not save a new user' do
        expect {
          post :create, user: attributes_for(:invalid_user)
        }.to change(User, :count).by(0)
      end

      it 're-renders :new template' do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end
end
