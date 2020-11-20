class BetweenDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    start_date = Time.parse("#{Date.current} 08:00")
    end_date = Time.parse("#{Date.current} 18:00")
    if value.present? && !value.between?(start_date, end_date)
      message = options[:message] || :start_date
      record.errors.add(attribute, message)
    end
  end
end