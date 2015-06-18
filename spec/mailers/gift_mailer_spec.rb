require "spec_helper"

describe GiftMailer do
  before { @gift = create(:gift) }

  it 'sends gift email' do
    email = GiftMailer.sign_up(@gift).deliver_now
    expect(ActionMailer::Base.deliveries).not_to be_empty
    expect(email.to).to eq [@gift.their_email]
    expect(email.subject).to match @gift.your_name
  end
end
