# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject do
    described_class.new(username: "Username",
                        country_code: "DE",
                        points: 500)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an username" do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a country_code" do
    subject.country_code = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a points" do
    subject.points = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid points" do
    subject.points = 100
    expect(subject).to_not be_valid
  end
end
