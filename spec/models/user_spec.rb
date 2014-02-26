require 'spec_helper'

describe User do
  describe '#set_default_username' do
    it 'gives the user a default user name of first_name_last_name if possible' do
      expect(User.new(first_name: 'Paul', last_name: 'Van Smith').send(:set_default_username)).to eq('paul_van_smith')
    end

    it 'gives the user a random int addition to username if already taken' do
      existing_user = create(:user, username: 'test_username')
      expect(User.new(first_name: 'test', last_name: 'username').send(:set_default_username)).to match(/test_username_\d+/)
    end
  end
end
