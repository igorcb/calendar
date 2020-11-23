require 'rails_helper'

RSpec.describe Meeting, type: :model do
  let!(:user) { create(:user) }
  let!(:room) { create(:room) }
  subject(:meeting) { build(:meeting) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:room_id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :room }
  

end
