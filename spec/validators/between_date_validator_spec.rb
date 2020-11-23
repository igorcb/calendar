require "rails_helper"

class Validatable
  include ActiveModel::Validations
  attr_accessor :date
  validates :date, between_date: true
end

describe BetweenDateValidator do
  subject { Validatable.new }

  context "when time not between 08:00 to 18:00" do
    before { subject.date = Time.parse("#{Date.current} 07:00") }
    it "should be valid" do
      expect(subject.valid?).to be_falsey
    end

    it "adds an error on model" do
      subject.valid?
      expect(subject.errors.keys).to include(:date)
    end
  end  
  
  context "when time between 08:00 to 18:00" do
    before { subject.date = Time.parse("#{Date.current} 09:00") }

    it "should be valid" do
      subject.date = Time.parse("#{Date.current} 09:00")
      expect(subject.valid?).to be_truthy
    end
  end

end