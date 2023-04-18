# frozen_string_literal: true

require "rails_helper"

RSpec.describe ::V1::Leaderboard::ListService do
  subject do
    described_class.call(**args)
  end

  let(:args) { {} }
  let(:country_code) { "DE" }
  let!(:users) { create_list(:user, 150) }
  let!(:users_with_country_code) { create_list(:user, 100, country_code:) }

  context "without country_code param" do
    it "should return list" do
      result = subject
      expect(result.size).to eq(100)
      expect(result[0].points).to eq(User.maximum(:points))
    end
  end

  context "with country_code param" do
    let(:args) { { country_code: } }

    it "should return list" do
      result = subject
      expect(result.size).to eq(100)
      expect(result[0].country_code).to eq(country_code)
      expect(result[0].points).to eq(User.where(country_code:).maximum(:points))
    end
  end
end
