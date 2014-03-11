module UserDecorator
  def name  # New method
    [first_name, last_name].reject(&:blank?).join(' ')
  end

  def ssn  # Override model method
    super && "xxx-xx-#{super[-4..-1]}"
  end
end
