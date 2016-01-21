require "rails_helper"

RSpec.describe Photo, type: :model do
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:caption) }

  it { is_expected.to validate_presence_of(:url) }

  it { is_expected.to belong_to(:user) }
end
