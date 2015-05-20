require 'spec_helper'

describe PaymentsController do
  describe 'GET #new' do
    context 'signed out' do
      it 'redirects to sign in' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'already signed up' do
      login_user

      it 'redirects to root page' do
        get :new
        expect(response).to redirect_to foods_path
      end
    end

    context 'without payment' do
      login_unpaid_user

      it 'assigns a new Payment to @payment' do
        get :new
        expect(assigns(:payment)).to be_a_new(Payment)
      end

      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe 'POST #create' do
  end
end
