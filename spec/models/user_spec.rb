require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new }
  before { allow_any_instance_of(EmailValidatorService).to receive(:valid?) { true } }

  context 'associations' do
    it { should have_one(:user_preference).dependent(:destroy) }
    it { should have_many(:surveys).dependent(:destroy) }
    it { should have_many(:survey_responses).dependent(:destroy) }
  end

  context 'validations' do
    before { subject.email = "kevin@gmail.com" }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  it "is not valid with email foo@" do
    subject.email = "foo@"
    expect(subject).to_not be_valid
  end

  it "is not valid with email foo#gmail.com" do
    subject.email = "foo#gmail.com"
    expect(subject).to_not be_valid
  end

  it "is valid with email kevin@gmail.com" do
    subject.email = "kevin@gmail.com"
    expect(subject).to be_valid
  end

  context "when EmailValidatorService returns false" do
    before { allow_any_instance_of(EmailValidatorService).to receive(:valid?) { false } }
    it "is not valid" do
      subject.email = "kevin@gmail.com"
      expect(subject).to_not be_valid
    end
  end
end
