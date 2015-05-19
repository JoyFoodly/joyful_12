require 'spec_helper'

describe PaymentsController do
  describe 'GET #new' do
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
