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
        stripeToken: subscription_attributes[:payment_token],
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
      post :create, stripe_params
      expect(response).to redirect_to(root_url)
    end

    it "Redirects the user back if there are errors" do
      post :create, stripe_params.merge(stripeBillingName: '')
      expect(response).to render_template(:new)
    end

  end
end
