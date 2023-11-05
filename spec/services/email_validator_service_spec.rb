require 'rails_helper'

RSpec.describe EmailValidatorService, type: :service do
  subject { EmailValidatorService.new(email: "kevin@gmail.com").valid? }

  context "when quality_score is less or equal to 0.7" do
    it "returns false" do
      allow_any_instance_of(Abstract).to receive(:call) { { "quality_score" => 0.7 } }
      expect(subject).to be_falsey
    end
  end

  context "when quality_score is greater than 0.7" do
    it "returns true" do
      allow_any_instance_of(Abstract).to receive(:call) { { "quality_score" => 0.8 } }
      expect(subject).to be_truthy
    end
  end

  context "when Abstract raises an error" do
    it "returns false" do
      allow_any_instance_of(Abstract).to receive(:call) { raise StandardError }
      expect(subject).to be_falsey
    end
  end
end
