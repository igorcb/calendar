class BetweenDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    @value ||= Time.parse("#{value.hour.to_s}:#{value.min.to_s}")
    start_date = Time.parse("08:00")
    end_date = Time.parse("18:00")
    if value.present? && !@value.between?(start_date, end_date)
      message = options[:message] || :between_date
      record.errors.add(attribute, message)
    end
  end
end