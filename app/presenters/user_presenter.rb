class UserPresenter < BasePresenter
  delegate :birthdate, :to => :object

  def name
    [object.first_name, object.last_name].reject(&:blank?).join(' ')
  end

  def ssn
    object.ssn && "xxx-xx-#{object.ssn[-4..-1]}"
  end
end
