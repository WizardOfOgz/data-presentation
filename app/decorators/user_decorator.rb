module UserDecorator
  include ActionView::Helpers::DateHelper  # For +distance_of_time_in_words+

  def name  # New method
    [last_name, first_name].reject(&:blank?).join(', ')
  end

  def ssn  # Override model method
    super && "xxx-xx-#{super[-4..-1]}"
  end

  def age
    distance_of_time_in_words(birthdate, Time.now)  if birthdate
  end
end
