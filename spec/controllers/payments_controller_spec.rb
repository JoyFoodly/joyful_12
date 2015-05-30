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

      it 'redirects to application' do
        get :new
        expect(response).to redirect_to foods_path
      end
    end

    context 'without payment' do
      login_unpaid_user

      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #gift' do
    it 'renders :gift template' do
      get :gift
      expect(response).to render_template :gift
    end

    it 'assigns a new gift to @gift' do
      get :gift
      expect(assigns(:gift)).to be_a_new(Gift)
    end
  end

  describe 'POST #create_gift' do
    let(:stripe_helper) { StripeMock.create_test_helper }
    before { @gift_params = FactoryGirl.attributes_for :gift }

    before do
      StripeMock.start
      StripeMock.toggle_debug(true)
      @stripeToken = stripe_helper.generate_card_token({ :number => '4242424242424242', :brand => 'Visa' })
    end

    after { StripeMock.stop }

    context 'valid stripe token and gift params' do
      it 'creates a payment' do
        expect { post :create_gift, stripeToken: @stripeToken, gift: @gift_params }.to change { Payment.count }.by(1)
      end

      it 'creates a gift' do
        expect { post :create_gift, stripeToken: @stripeToken, gift: @gift_params }.to change { Gift.count }.by(1)
      end
    end

    context 'invalid gift' do
      it 'should redirect to gift' do
        @gift_params[:your_email] = nil
        post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        expect(response).to render_template :gift
      end
    end

    context 'invalid stripe token' do
      render_views

      subject { response }
      describe 'incorrect credit card number' do
        before do
          StripeMock.prepare_card_error(:incorrect_number)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /The card number is incorrect/ }
      end

      describe 'invalid credit card number' do
        before do
          StripeMock.prepare_card_error(:invalid_number)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /The card number is not a valid credit card number/ }
      end

      describe 'invalid exp month' do
        before do
          StripeMock.prepare_card_error(:invalid_expiry_month)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /The card's expiration month is invalid/ }
      end

      describe 'invalid exp year' do
        before do
          StripeMock.prepare_card_error(:invalid_expiry_year)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /The card's expiration year is invalid/ }
      end

      describe 'invalid cvc' do
        before do
          StripeMock.prepare_card_error(:invalid_cvc)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /The card's security code is invalid/ }
      end


      describe 'expired card' do
        before do
          StripeMock.prepare_card_error(:expired_card)
          post :create_gift, { stripeToken: @stripeToken, gift: @gift_params }
        end

        it { should render_template :gift }
        its(:body) { should match /The card has expired/ }
      end

      describe 'incorrect cvc' do
        before do
          StripeMock.prepare_card_error(:incorrect_cvc)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /The card's security code is incorrect/ }
      end

      describe 'card declined' do
        before do
          StripeMock.prepare_card_error(:card_declined)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /The card was declined/ }
      end

      describe 'missing card' do
        before do
          StripeMock.prepare_card_error(:missing)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /There is no card on a customer that is being charged/ }
      end

      describe 'processing error' do
        before do
          StripeMock.prepare_card_error(:processing_error)
          post :create_gift, stripeToken: @stripeToken, gift: @gift_params
        end

        it { should render_template :gift }
        its(:body) { should match /An error occurred while processing the card/ }
      end
    end
  end

  describe 'POST #create' do
    let(:stripe_helper) { StripeMock.create_test_helper }

    login_unpaid_user

    before do
      StripeMock.start
      @stripeToken = stripe_helper.generate_card_token({ :number => '4242424242424242', :brand => 'visa' })
    end

    after { StripeMock.stop }

    context 'valid stripe token' do
      it 'redirects the user to be onboarded' do
        post :create, stripeToken: @stripeToken
        expect(response).to redirect_to edit_user_path(@user)
      end

      it 'creates a payment' do
        expect { post :create, stripeToken: @stripeToken }.to change { Payment.count }.by(1)
      end
    end

    context 'invalid stripe token' do
      render_views

      subject { response }
      describe 'incorrect credit card number' do
        before do
          StripeMock.prepare_card_error(:incorrect_number)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /The card number is incorrect/ }
      end

      describe 'invalid credit card number' do
        before do
          StripeMock.prepare_card_error(:invalid_number)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /The card number is not a valid credit card number/ }
      end

      describe 'invalid exp month' do
        before do
          StripeMock.prepare_card_error(:invalid_expiry_month)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /The card's expiration month is invalid/ }
      end

      describe 'invalid exp year' do
        before do
          StripeMock.prepare_card_error(:invalid_expiry_year)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /The card's expiration year is invalid/ }
      end

      describe 'invalid cvc' do
        before do
          StripeMock.prepare_card_error(:invalid_cvc)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /The card's security code is invalid/ }
      end


      describe 'expired card' do
        before do
          StripeMock.prepare_card_error(:expired_card)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /The card has expired/ }
      end

      describe 'incorrect cvc' do
        before do
          StripeMock.prepare_card_error(:incorrect_cvc)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /The card's security code is incorrect/ }
      end

      describe 'card declined' do
        before do
          StripeMock.prepare_card_error(:card_declined)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /The card was declined/ }
      end

      describe 'missing card' do
        before do
          StripeMock.prepare_card_error(:missing)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /There is no card on a customer that is being charged/ }
      end

      describe 'processing error' do
        before do
          StripeMock.prepare_card_error(:processing_error)
          post :create, stripeToken: @stripeToken
        end

        it { should render_template :new }
        its(:body) { should match /An error occurred while processing the card/ }
      end
    end
  end
end
