require 'spec_helper'

describe User do
  before { @user = build(:user) }

  describe 'factory' do
    subject { @user }
    it { expect(subject.valid?).to be true }
  end

  describe 'user validation' do
    subject { @user }

    [:first_name, :last_name, :email, :password, :password_confirmation].each do |attr|
      it { should respond_to attr }
    end

    [:first_name=, :last_name=].each do |name_setter|
      context name_setter.to_s.chop do
        describe 'missing' do
          before { subject.send name_setter, nil }
          it { should_not be_valid }
        end

        describe 'blank' do
          before { subject.send name_setter, ' ' }
          it { should_not be_valid }
        end

        describe 'too long' do
          before { subject.send name_setter, 'a' * 36 }
          it { should_not be_valid }
        end
      end
    end

    context 'email' do
      describe 'missing' do
        before { subject.email = nil }
        it { should_not be_valid }
      end

      describe 'blank' do
        before { subject.email = ' ' }
        it { should_not be_valid }
      end

      describe 'when email address is already taken' do
        before do
          user_with_same_email = @user.dup
          user_with_same_email.email = @user.email.upcase
          user_with_same_email.save
        end

        it { should_not be_valid }
      end
    end

    context 'password' do
      describe 'missing' do
        before do 
          subject.password = nil
          subject.password_confirmation = nil
        end

        it { should_not be_valid }
      end

      describe 'blank' do
        before do
          subject.password = ' '
          subject.password_confirmation = ' '
        end

        it { should_not be_valid }
      end

      describe 'does not match confirmation' do
        before { subject.password_confirmation = 'mismatch' }
        it { should_not be_valid }
      end

      describe 'too short' do
        before do
          subject.password = 'a' * 7
          subject.password_confirmation = 'a' * 7
        end
        it { should_not be_valid }
      end

      describe 'too long' do
        before do
          subject.password = 'a' * 129
          subject.password_confirmation = 'a' * 129
        end
        it { should_not be_valid }
      end
    end
  end

  describe 'signed_up' do
    it 'should be false by default' do
      @user = User.new
      expect(@user.signed_up?).to be false
    end
  end

  describe '#send_confirmation' do
    it 'should send email after create' do
      expect { @user.save }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

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
