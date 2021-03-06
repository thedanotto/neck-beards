require 'rails_helper'

describe User do
  subject { @user = build(:user) }
  it { is_expected.to validate_length_of(:bio).is_at_most(140) }
  it { is_expected.to validate_presence_of(:full_name) }
  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  it { is_expected.to have_many(:photos) }
end
