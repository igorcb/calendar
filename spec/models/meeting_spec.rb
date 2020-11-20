require 'rails_helper'

RSpec.describe Meeting, type: :model do
  
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:room_id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :room }
  
  it "can't between 08:00 to 18:00" do
    subject.start_date = Time.parse("#{Date.current} 07:00")
    subject.valid?
    expect(subject.errors.keys).to include :start_date
  end

  it "is valid between 08:00 to 18:00" do
    subject.start_date = Time.parse("#{Date.current} 09:00")
    subject.valid?
    expect(subject.errors.keys).to_not include :start_date
  end

  it "can't between 08:00 to 18:00" do
    subject.end_date = Time.parse("#{Date.current} 07:00")
    subject.valid?
    expect(subject.errors.keys).to include :end_date
  end

  it "is valid between 08:00 to 18:00" do
    subject.end_date = Time.parse("#{Date.current} 09:00")
    subject.valid?
    expect(subject.errors.keys).to_not include :end_date
  end

end
