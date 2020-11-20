require 'rails_helper'

RSpec.describe Room, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to define_enum_for(:status).with_values({ not_occuped: 1, occuped: 2 }) }
  it { is_expected.to have_many(:meetings).dependent(:destroy) }

end
