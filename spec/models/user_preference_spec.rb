require 'rails_helper'

RSpec.describe UserPreference, type: :model do
  let(:user) { User.create(email: "kevin@gmail.com") }
  subject { user.build_user_preference }

  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    context "when user does not have at least one preference" do
      it "is not valid" do
        expect(subject).to_not be_valid
      end
    end

    context "when user has at least one preference" do
      before { subject.men_fashion = true }
      it "is valid" do
        expect(subject).to be_valid
      end
    end
  end
end
