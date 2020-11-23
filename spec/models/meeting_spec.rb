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
  
  it "can't start_date between 08:00 to 18:00" do
    subject.start_date = Time.parse("#{Date.current} 07:00 UTC")
    subject.valid?
    puts ">>>>>>>>>> StartDate Msn: #{subject.errors.keys} ===== StarDate: #{subject.start_date}"
    expect(subject.errors.keys.include?(:start_date)).to be_truthy
  end

  it "start_date is valid between 08:00 to 18:00" do
    subject.start_date = Time.parse("#{Date.current} 09:00 UTC")
    subject.valid?
    expect(subject.errors.keys.include?(:start_date)).to be_falsy
  end

  it "can't end_date between 08:00 to 18:00" do
    subject.end_date = "2020-11-22 07:00:00" #Time.parse("#{Date.current} 06:00 UTC")
    subject.valid?
    puts ">> EndDate Msn: #{subject.errors.keys} ===== EndDate: #{subject.end_date}"
    puts "EndDateInclude: #{subject.errors.keys.include?(:end_date)} ===== EndDate: #{subject.end_date}"
    expect(subject.errors.keys.include?(:end_date)).to be_truthy
  end

  it "is end_date valid between 08:00 to 18:00" do
    subject.end_date = "2020-11-22 09:00:00" #Time.parse("#{Date.current} 06:00 UTC")
    subject.valid?
    expect(subject.errors.keys.include?(:end_date)).to be_falsy
  end

end
