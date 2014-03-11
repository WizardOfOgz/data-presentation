class UserPresenter < BasePresenter
  include ActionView::Helpers::DateHelper  # For +distance_of_time_in_words+

  delegate :birthdate, :to => :object

  def name
    [object.first_name, object.last_name].reject(&:blank?).join(' ')
  end

  def ssn
    object.ssn && "xxx-xx-#{object.ssn[-4..-1]}"
  end

  def age
    distance_of_time_in_words(birthdate, Time.now)  if birthdate
  end
end
