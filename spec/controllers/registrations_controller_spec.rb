require 'spec_helper'

describe RegistrationsController do
  describe "POST #create" do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    let(:user_attributes) { FactoryGirl.attributes_for(:user) }
    let(:address_attributes) { FactoryGirl.attributes_for(:address) }
    let(:subscription_attributes) { FactoryGirl.attributes_for(:subscription) }
    let(:stripe_params) do
      {
        plan_id: 'beta',
        stripeToken: subscription_attributes[:card_token],
        stripeEmail: user_attributes[:email],
        stripeBillingName: "#{user_attributes[:first_name]} #{user_attributes[:last_name]}",
        stripeBillingAddressLine1: address_attributes[:line_1],
        stripeBillingAddressZip: address_attributes[:zip_code],
        stripeBillingAddressCity: address_attributes[:city],
        stripeBillingAddressState: address_attributes[:state],
        stripeBillingAddressCountry: address_attributes[:country]
      }
    end

    it "Redirects to user profile if successful" do
      Subscription.any_instance.should_receive(:stripe_customer_created)
      post :create, stripe_params
      expect(response).to redirect_to(root_url)
    end

    it "Redirects the user back if there are user creation errors" do
      post :create, stripe_params.merge(stripeBillingName: 'James')
      expect(assigns(:user).errors.full_messages).to eq(["Last name can't be blank"])
      expect(response).to render_template(:new)
      expect(User.count + Address.count + Subscription.count).to eq(0)
    end

    it "Redirects the user back if there are address creation errors" do
      post :create, stripe_params.merge(stripeBillingAddressLine1: '')
      expect(assigns(:user).errors.full_messages).to eq(["Line 1 can't be blank"])
      expect(response).to render_template(:new)
      expect(User.count + Address.count + Subscription.count).to eq(0)
    end

    it "Redirects the user back if there are subscription creation errors" do
      post :create, stripe_params.merge(plan_id: '')
      expect(assigns(:user).errors.full_messages).to include('Plan is not included in the list')
      expect(response).to render_template(:new)
      expect(User.count + Address.count + Subscription.count).to eq(0)
    end

    it "Redirects the user back if there are remote subscription creation errors" do
      Stripe::Customer.should_receive(:create).and_raise(Stripe::CardError.new('Invalid card number', {}, 422))
      post :create, stripe_params
      expect(assigns(:user).errors.full_messages).to eq(["Invalid card number"])
      expect(response).to render_template(:new)
      expect(User.count + Address.count + Subscription.count).to eq(0)
    end

  end
end
